class Recipe < ActiveRecord::Base
	validates :title, presence: true, uniqueness: { case_sensitive: false }
	validates :instruction, presence: true
	has_and_belongs_to_many :ingredients
	accepts_nested_attributes_for :ingredients, reject_if: :all_blank
	belongs_to :category
	before_validation :find_ingredients
	before_save { self.title = title.titleize }

	def self.search(search)
		where('title like ?', "%#{search}%")
	end

	private

	def find_ingredients
		self.ingredients = self.ingredients.map {|i| Ingredient.find_or_initialize_by(name: i.name)}
	end
end
