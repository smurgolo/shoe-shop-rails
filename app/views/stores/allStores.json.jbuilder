json.stores @stores do |store|
  json.id store.id
  json.address store.address
  json.name store.name
end
json.success @stores.empty?
json.total_elements @stores.size