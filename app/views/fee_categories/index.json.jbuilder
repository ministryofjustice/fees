json.array! @categories do |category|
  json.title category.title
  json.link category.friendly_id
end
