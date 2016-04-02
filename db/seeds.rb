# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

arr = ["Appetizers", "Soups", "Main Dishes", "Breakfast", "Beverages", "Desserts", "Breads", "Side Dishes", "Snacks", "Misc.", 
			 "Canning", "Salads"]

arr.each do |category|
	Category.find_or_create_by(title: category)
end

