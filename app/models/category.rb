class Category < ActiveRecord::Base
	has_many :recipes

	#options = ["Entree", "Dessert"]
end
