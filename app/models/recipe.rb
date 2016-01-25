class Recipe < ActiveRecord::Base
	validates :title, presence: true, uniqueness: { case_sensitive: false }
	has_and_belongs_to_many :ingredients
	accepts_nested_attributes_for :ingredients
	belongs_to :category
end
