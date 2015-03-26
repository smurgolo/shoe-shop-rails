# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



st = Store.create(name: 'Viamo', address: 'Calle 9 Esquina 49 N°856 La Plata')
if st.errors.blank?
  puts "***Store id: #{st.id} created ***"
  art = Article.create(name: 'ZAPATILLA CHIPRE ANIMAL PRINT', description: 'Zapatilla Chipre animal print de Viamo. Están confeccionadas en cuero. Poseen dos cierres laterales', price: 1499, total_in_shelf: 25, store: st)
  if art.errors.blank?
    puts "***Article id: #{art.id} created ***"
  end
else
  puts "***Store failed to create due to below reasons: "
  st.errors.each do |x, y|
    puts"#{x} #{y}" # x will be the field name and y will be the error on it
  end
end
