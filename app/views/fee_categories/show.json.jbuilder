json.category @category.title

json.fees @category.fees do |fee|
  json.title fee.title
end
