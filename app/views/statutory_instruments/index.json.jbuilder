json.array! @statutory_instruments do |si|
  json.title si.title
  json.coming_into_force si.coming_into_force
  json.link si.friendly_id
end
