# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create([{title: "Appetizers"}, {title: "Soups"}, {title: "Main Dishes"}, {title: "Breakfast"}, {title: "Beverages"},
								 {title: "Desserts"}, {title: "Breads"}, {title: "Side Dishes"}, {title: "Snacks"}, {title: "Misc."}, 
								 {title: "Canning"}])
