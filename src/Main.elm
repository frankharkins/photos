module Main exposing (main)

import Set
import Browser
import Html exposing (Html, h1, p, div, span, text, img, figure, figcaption)
import Html.Events exposing (onClick)
import Html.Attributes exposing (class, id, src, tabindex)
import Html.Events exposing (onMouseEnter, onMouseLeave, onClick, on, stopPropagationOn)
import Json.Decode as Json

import ImageUtils exposing (..)
import Data exposing (image_groups)

all_images : List Image
all_images = flatten_image_groups image_groups

-- MAIN

main =
  Browser.sandbox { init = init, update = update, view = view }


-- MODEL
-- There are only three states to this page
-- 1. None: Page appears as it does on load
-- 2. HoveredImage: User's cursor is hovered over a thumbnail
-- 3. ModalImage: A full-window image modal is open
type PageState =
  None
  | HoveredImage Image
  | ModalImage Image

type alias Model = { state: PageState, loaded_images: Set.Set String }

init : Model
init = { state = None, loaded_images = Set.empty }


-- UPDATE
type Msg =
  EnterHover Image
  | ExitHover
  | EnterModal Image
  | ModalLoaded String
  | NextModal
  | PreviousModal
  | ExitModal
  | DoNothing

update: Msg -> Model -> Model
update msg model =
  case msg of
    DoNothing -> model
    EnterHover image ->
      case model.state of
        ModalImage _ -> model
        _ -> { model | state = HoveredImage image }
    EnterModal image -> { model | state = ModalImage image }
    ModalLoaded filename ->
      { model | loaded_images = (Set.insert filename model.loaded_images)}
    PreviousModal ->
      case model.state of
        ModalImage image ->
          case (get_sibling image all_images Previous) of
            Nothing -> { model | state = ModalImage image }
            Just new_image -> { model | state = ModalImage new_image }
        _ -> model
    NextModal ->
      case model.state of
        ModalImage image ->
          case (get_sibling image all_images Next) of
            Nothing -> { model | state = ModalImage image }
            Just new_image -> { model | state = ModalImage new_image }
        _ -> model
    ExitHover ->
      case model.state of
        HoveredImage _ -> { model | state = None }
        _ -> model
    ExitModal ->
      case model.state of
        ModalImage _ -> { model | state = None }
        _ -> model

-- VIEW
view : Model -> Html Msg
view model =
  div []
    ((image_modal model) ++ [
    div [ id "app" ] [
      h1 [] [ text "Frank's photography" ],
      p [ class "mono" ] [ text "Some of my favourite photos. This page is still a work in progress." ],
      div [] (List.map (render_image_group model) image_groups)
    ]])

get_image_path : String -> String -> String
get_image_path folder filename =
  "./images/" ++ folder ++ "/" ++ filename ++ ".avif"

render_image_group : Model -> ImageGroup -> Html Msg
render_image_group selected_image group =
  figure [ class "photo-group" ] [
    div [ class "thumbnails" ] (
      List.map (\image -> img [
        src (get_image_path "thumbnails" image.filename),
        class "thumb",
        tabindex 1,
        onMouseEnter (EnterHover (add_group_label group.name image)),
        onMouseLeave ExitHover,
        onClick (EnterModal (add_group_label group.name image))
      ]
        []) group.images
    ),
    figcaption [] ((text group.name) :: image_name_if_hovered selected_image group)
  ]

image_name_if_hovered : Model -> ImageGroup -> List (Html Msg)
image_name_if_hovered model group =
  case model.state of
    HoveredImage image ->
      if image.group == group.name then
        [ div [ class "text-secondary" ] [ text image.title ] ]
      else
        []
    ModalImage _ ->
      []
    None ->
      []

image_modal : Model -> List (Html Msg)
image_modal model =
  case model.state of
    None -> []
    HoveredImage _ -> []
    ModalImage image ->
      let image_folder = if Set.member image.filename model.loaded_images then "full-res" else "thumbnails"
      in [
        div [ class "image-modal", class image_folder, onClick ExitModal ] [
          figure [ onClickNoPropogation DoNothing ] [
            img [
              src (get_image_path image_folder image.filename)
              , onImageLoad (ModalLoaded image.filename)
            ] [ ],
            figcaption [] [
              text image.title,
              div [ class "text-secondary" ] [ text image.description ]
            ],
            modal_nav image
        ]]]

modal_nav : Image -> Html Msg
modal_nav image =
  let
    prev = if (position image all_images) /= First then [
        span [ class "previous", onClickNoPropogation PreviousModal ] [ text "Previous" ]
        , span [ ] [ text " | " ]]
        else []
    next = if (position image all_images) /= Last then [
        span [ ] [ text " | " ]
        , span [ class "next", onClickNoPropogation NextModal ] [ text "Next" ]]
      else []
    close = [span [ class "close", onClickNoPropogation ExitModal ] [ text "Close" ]]
  in
    div [ class "modal-nav" ] (prev ++ close ++ next)

onClickNoPropogation : Msg -> Html.Attribute Msg
onClickNoPropogation msg =
  stopPropagationOn "click" (Json.map (\m -> (m, True)) (Json.succeed msg))

onImageLoad : Msg -> Html.Attribute Msg
onImageLoad msg =
  on "load" (Json.succeed msg)
