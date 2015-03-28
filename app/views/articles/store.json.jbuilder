json.articles @articles do |article|
  json.id article.id
  json.description article.description
  json.name article.name
  json.price article.price
  json.total_in_shelf article.total_in_shelf
  json.total_in_vault article.total_in_vault
  json.store_name article.store.name
end
json.success !@articles.empty?
json.total_elements @articles.count
