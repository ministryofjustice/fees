json.category @category.title

json.fees @category.fee_types do |fee|
  json.title fee.title
  json.amount fee.amount
end
