require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@recipe = Recipe.new(title: "Pizza", instruction: "Cook it", category_id: 1,)
  	@recipe.ingredients << Ingredient.new(name: "Dough")
  	@recipe.ingredients << Ingredient.new(name: "Pepperoni")
  end

  test "should be valid" do
  	assert @recipe.valid?
  end

  test "title should be present" do
  	@recipe.title = " "
  	assert_not @recipe.valid?
  end

  test "instructions sould be present" do
  	@recipe.instruction = " "
  	assert_not @recipe.valid?
  end
end
