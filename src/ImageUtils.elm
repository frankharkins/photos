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

get_by_index : List a -> Int -> Maybe a
get_by_index list index =
  let maybe_tuple = List.head (List.filter (\element -> Tuple.first element == index) (List.indexedMap Tuple.pair list))
  in
  case maybe_tuple of
    Just element -> Just (Tuple.second element)
    _ -> Nothing

get_index : a -> List a -> Maybe Int
get_index element list =
  let maybe_index_and_element = List.head (List.filter (\e -> Tuple.second e == element) (List.indexedMap Tuple.pair list))
  in
    case maybe_index_and_element of
      Nothing -> Nothing
      Just index_and_element -> Just (Tuple.first index_and_element)

type RelativePosition = Previous | Next
get_sibling : a -> List a -> RelativePosition -> Maybe a
get_sibling element list relative_position =
  let offset = if relative_position == Previous then -1 else 1
  in
  case (get_index element list) of
    Nothing -> Nothing
    Just index -> get_by_index list (index + offset)
