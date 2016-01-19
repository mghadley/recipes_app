class Recipe < ActiveRecord::Base
	has_and_belongs_to_many :ingredients
	accepts_nested_attributes_for :ingredients
	belongs_to :category
end
