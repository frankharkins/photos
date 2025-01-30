module Main exposing (..)

import Browser
import Html exposing (Html, h1, p, div, span, text, img, figure, figcaption)
import Html.Events exposing (onClick)
import Html.Attributes exposing (class, id, src, tabindex)
import Html.Events exposing (onMouseEnter, onMouseLeave, onClick)
import Html.Events exposing (stopPropagationOn)
import Json.Decode as Json


type alias Image = { filename: String, title: String, description: String, group: String }
type alias ImageGroup = { name: String, description: String, images: List Image }
image_groups: List ImageGroup
-- Insert new files here, along with their description
image_groups = [
  { name = "Durdle Door",
    description = "Photos taken from around Durdle Door",
    images = [
      { filename = "durdle",
        title = "Durdle Door from Swyre Head",
        description = "After ~15 miles of trekking through fog, the sky cleared as we reached Bat's Head to reveal Durdle Door.",
        group = "Durdle Door"
      },
      { filename = "man-o-war",
        title = "Man O' War Cove",
        description = "I returned at blue hour to take this photo of Man O' War Cove, the other side of Durdle Door.",
        group = "Durdle Door"
      },
      { filename = "bats-head",
        title = "Beach from Bat's Head",
        description = "Featuring red sand and a chalky sea",
        group = "Durdle Door"
      },
      { filename = "butter-rock",
        title = "Butter Rock",
        description = "Taken from Bat's Head",
        group = "Durdle Door"
      },
      { filename = "durdle-coastline",
        title = "Coastline around Durdle Door",
        description = "Shot from further up the hill",
        group = "Durdle Door"
      }
    ]
  },
  { name = "Sand reflections",
    description = "Sunset reflected in a thin film of water over the sand on Combsegate Beach",
    images = [
      { filename = "sand-reflection-silhouette",
        title = "Photographer on Combesgate Beach",
        description = "Silhouette of a photographer reflected in a thin film of water on Combesgate Beach",
        group = "Sand reflections"
      },
      { filename = "sand-reflection",
        title = "Sunset from Combesgate Beach",
        description = "Sunset reflected in a thin film of water on Combesgate Beach",
        group = "Sand reflections"
      }
    ]
  },
  { name = "South West Coast Path",
    description = "Snaps from various holiday along the South West Coast Path",
    images = [
      { filename = "combesgate-beach",
        title = "Sand ripples on Combesgate Beach",
        description = "Near Woolacombe",
        group = "South West Coast Path"
      },
      { filename = "coastline-houns-tout",
        title = "Green and grey coastline",
        description = "Looking west from near Houns Tout",
        group = "South West Coast Path"
      },
      { filename = "black-rock-beach",
        title = "Black rock beach",
        description = "East along the coast from Kimmeridge Bay",
        group = "South West Coast Path"
      },
      { filename = "lonely-seal",
        title = "Lonely seal",
        description = "Chillin' off the Isle of Portland",
        group = "South West Coast Path"
      },
      { filename = "telescope",
        title = "Telescope in Ilfracombe",
        description = "Overlooking Lantern Hill Lighthouse",
        group = "South West Coast Path"
      }
    ]
  },
  { name = "Rocks reflecting",
    description = "Rocks reflected in water in the Lake District",
    images = [
      { filename = "rocks-reflecting-1",
        title = "#1",
        description = "Grasmere, Lake District",
        group = "Rocks reflecting"
      },
      { filename = "rocks-reflecting-2",
        title = "#2",
        description = "Grasmere, Lake District",
        group = "Rocks reflecting"
      },
      { filename = "rocks-reflecting-3",
        title = "#3",
        description = "Rydal Water, Lake District",
        group = "Rocks reflecting"
      }
    ]
  },
  { name = "Beachy Head",
    description = "Photos around Beachy Head, Eastbourne",
    images = [
      { filename = "beachy-head-1",
        title = "Lighthouse",
        description = "Lighthouse at blue hour",
        group = "Beachy Head"
      },
      { filename = "beachy-head-2",
        title = "Grass",
        description = "Golden grass against a grey sea",
        group = "Beachy Head"
      },
      { filename = "beachy-head-3",
        title = "Eastbourne",
        description = "Eastbourne from the path to Beachy Head",
        group = "Beachy Head"
      }
    ]
  },
  { name = "Blue lines",
    description = "Experiments with computer-generated patterns and slide film",
    images = [
      { filename = "waves-1",
        title = "#1",
        description = "",
        group = "Blue lines"
      },
      { filename = "waves-2",
        title = "#2",
        description = "",
        group = "Blue lines"
      },
      { filename = "waves-3",
        title = "#3",
        description = "",
        group = "Blue lines"
      }
    ]
  },
  { name = "Macro",
    description = "Using a home-made bellows system, inspired by Karl Blossfeldt. This stuff if hard.",
    images = [
      { filename = "mushroom-1",
        title = "Mushroom #1",
        description = "",
        group = "Macro"
      },
      { filename = "mushroom-2",
        title = "Mushroom #2",
        description = "",
        group = "Macro"
      },
      { filename = "mushroom-3",
        title = "Mushroom #3",
        description = "",
        group = "Macro"
      }
    ]
  },
  { name = "Aquarium",
    description = "Trip to Sea Life aquarium, London",
    images = [
      { filename = "clownfish",
        title = "Clownfish",
        description = "The clownfish were beautiful, would recommend",
        group = "Aquarium"
      },
      { filename = "otherfish",
        title = "Blue fish",
        description = "No idea what kind of fish these are",
        group = "Aquarium"
      },
      { filename = "jellyfish",
        title = "Jellyfish",
        description = "Japanese Sea Nettle",
        group = "Aquarium"
      }
    ]
  },
  { name = "London brutalism",
    description = "From a tour of brutalist architecture in London",
    images = [
      { filename = "alexandra-road-estate",
        title = "Alexandra Road Estate",
        description = "",
        group = "London brutalism"
      },
      { filename = "alexandra-road-estate-2",
        title = "Stairs",
        description = "Also at Alexandra Road Estate",
        group = "London brutalism"
      },
      { filename = "royal-college-physicians",
        title = "Royal College of Physicians",
        description = "",
        group = "London brutalism"
      },
      { filename = "southbank-centre",
        title = "Southbank Centre",
        description = "Featuring light leaks",
        group = "London brutalism"
      }
    ]
  },
  { name = "Lagos",
    description = "Snapshots from a holiday to Portugal",
    images = [
      { filename = "lagos-1",
        title = "#1",
        description = "",
        group = "Lagos"
      },
      { filename = "lagos-2",
        title = "#2",
        description = "",
        group = "Lagos"
      },
      { filename = "lagos-3",
        title = "#3",
        description = "",
        group = "Lagos"
      },
      { filename = "lagos-4",
        title = "#4",
        description = "",
        group = "Lagos"
      },
      { filename = "lagos-5",
        title = "#5",
        description = "",
        group = "Lagos"
      },
      { filename = "lagos-6",
        title = "#6",
        description = "",
        group = "Lagos"
      },
      { filename = "lagos-7",
        title = "#7",
        description = "",
        group = "Lagos"
      },
      { filename = "lagos-8",
        title = "#8",
        description = "",
        group = "Lagos"
      }
    ]
  },
  { name = "Cyanotypes",
    description = "Scans of small prints made using the cyanotype technique",
    images = [
      { filename = "cyanotype-1",
        title = "Autumn willow",
        description = "Near Poynton Pool. A red filter renders yellow leaves white and others dark.",
        group = "Cyanotypes"
      },
      { filename = "cyanotype-2",
        title = "Tree on Wandsworth common",
        description = "In the fog",
        group = "Cyanotypes"
      }
    ]
  }]

type ListPosition = First | Last | Neither
position_in_group : Image -> ListPosition
position_in_group image =
  let maybe_group = List.head (List.filter (\g -> g.name == image.group) image_groups)
  in
    case maybe_group of
      Nothing -> Neither
      Just group ->
        if (List.head group.images == Just image) then
          First
        else if (List.head (List.reverse group.images) == Just image) then
            Last
          else
            Neither

get_by_index : List Image -> Int -> Maybe Image
get_by_index list index =
  let maybe_tuple = List.head (List.filter (\element -> Tuple.first element == index) (List.indexedMap Tuple.pair list))
  in
  case maybe_tuple of
    Just element -> Just (Tuple.second element)
    _ -> Nothing

group_and_index : Image -> Maybe (ImageGroup, Int)
group_and_index image =
  let maybe_group = List.head (List.filter (\g -> g.name == image.group) image_groups)
  in
    case maybe_group of
      Just group ->
        let maybe_index_and_image = List.head (List.filter (\i -> Tuple.second i == image) (List.indexedMap Tuple.pair group.images))
        in
          case maybe_index_and_image of
            Just index_and_image -> Just (group, Tuple.first index_and_image)
            _ -> Nothing
      _ -> Nothing

get_sibling_in_group : Image -> Int -> Image
get_sibling_in_group image offset =
  case (group_and_index image) of
    Nothing -> image
    Just result ->
      case get_by_index (Tuple.first result).images ((Tuple.second result) + offset) of
        Nothing -> image
        Just next_image -> next_image

get_path : String -> Image -> String
get_path folder image =
  "./images/" ++ folder ++ "/" ++ image.filename ++ ".avif"



-- MAIN

main =
  Browser.sandbox { init = init, update = update, view = view }


-- MODEL
-- TODO: Work out how to make these "maybe" types
type SelectedImage =
  HoveredImage Image
  | ModalImage Image
  | None
type alias Model = SelectedImage

init : Model
init = None



-- UPDATE
type Msg =
  EnterHover Image
  | ExitHover
  | EnterModal Image
  | NextModal
  | PreviousModal
  | ExitModal
  | DoNothing

update: Msg -> Model -> Model
update msg model =
  case msg of
    DoNothing -> model
    EnterHover image ->
      case model of
        ModalImage _ -> model
        _ -> HoveredImage image
    EnterModal image -> ModalImage image
    PreviousModal ->
      case model of
        ModalImage image -> ModalImage (get_sibling_in_group image -1)
        _ -> model
    NextModal ->
      case model of
        ModalImage image -> ModalImage (get_sibling_in_group image 1)
        _ -> model
    ExitHover ->
      case model of
        HoveredImage _ -> None
        _ -> model
    ExitModal ->
      case model of
        ModalImage _ -> None
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

render_image_group : SelectedImage -> ImageGroup -> Html Msg
render_image_group selected_image group =
  figure [ class "photo-group" ] [
    div [ class "thumbnails" ] (
      List.map (\image -> img [
        src (get_path "thumbnails" image),
        class "thumb",
        tabindex 1,
        onMouseEnter (EnterHover image),
        onMouseLeave ExitHover,
        onClick (EnterModal image)
      ]
        []) group.images
    ),
    figcaption [] ((text group.name) :: image_name_if_hovered selected_image group)
  ]

image_name_if_hovered : SelectedImage -> ImageGroup -> List (Html Msg)
image_name_if_hovered selected_image group =
  case selected_image of
    HoveredImage image ->
      if image.group == group.name then
        [ div [ class "text-secondary" ] [ text image.title ] ]
      else
        []
    ModalImage _ ->
      []
    None ->
      []

image_modal : SelectedImage -> List (Html Msg)
image_modal selected_image =
  case selected_image of
    None -> []
    HoveredImage _ -> []
    ModalImage image -> [
      div [ class "image-modal", onClick ExitModal ] [
        figure [ onClickNoPropogation DoNothing ] [
          img [ src (get_path "full-res" image) ] [ ],
          figcaption [] [
            text image.title,
            div [ class "text-secondary" ] [ text image.description ]
          ],
          modal_nav image
      ]]]

modal_nav : Image -> Html Msg
modal_nav image =
  let
    prev = if position_in_group image /= First then [
        span [ class "previous", onClickNoPropogation PreviousModal ] [ text "Previous" ]
        , span [ ] [ text " | " ]]
        else []
    next = if position_in_group image /= Last then [
        span [ ] [ text " | " ]
        , span [ class "next", onClickNoPropogation NextModal ] [ text "Next" ]]
      else []
    close = [span [ class "close", onClickNoPropogation ExitModal ] [ text "Close" ]]
  in
    div [ class "modal-nav" ] (prev ++ close ++ next)

onClickNoPropogation : Msg -> Html.Attribute Msg
onClickNoPropogation msg =
  stopPropagationOn "click" (Json.map (\m -> (m, True)) (Json.succeed msg))
