module ImageUtils exposing (..)

type alias ImageWithoutGroup = { filename: String, title: String, description: String }
type alias Image = { filename: String, title: String, description: String, group: String }
type alias ImageGroup = { name: String, description: String, images: List ImageWithoutGroup }

add_group_label : String -> ImageWithoutGroup -> Image
add_group_label group_name image =
  { title = image.title, description = image.description, filename = image.filename, group = group_name }

flatten_image_groups : List ImageGroup -> List Image
flatten_image_groups image_groups = List.foldr (\a -> \b -> (List.map (\im -> add_group_label a.name im) a.images) ++ b) [] image_groups

type ListPosition = First | Last | Neither
position : Image -> List Image -> ListPosition
position image image_list =
  if (List.head image_list == Just image) then
    First
  else if (List.head (List.reverse image_list) == Just image) then
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

get_index : Image -> List Image -> Maybe Int
get_index image image_list =
  let maybe_index_and_image = List.head (List.filter (\i -> Tuple.second i == image) (List.indexedMap Tuple.pair image_list))
  in
    case maybe_index_and_image of
      Nothing -> Nothing
      Just index_and_image -> Just (Tuple.first index_and_image)

type RelativePosition = Previous | Next
get_sibling : Image -> List Image -> RelativePosition -> Image
get_sibling image image_list relative_position =
  let offset = if relative_position == Previous then -1 else 1
  in
  case (get_index image image_list) of
    Nothing -> image
    Just index ->
      case get_by_index image_list (index + offset) of
        Nothing -> image
        Just next_image -> next_image
