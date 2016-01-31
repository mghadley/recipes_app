require 'test_helper'

class CreateRecipeTest < ActionDispatch::IntegrationTest
  test "valid recipe creation" do
  	get new_path
  	assert_difference 'Recipe.count', 1 do
	  	post_via_redirect create_path, recipe: { title: "Chicken", instruction: "Slow cook it", category_id: 1,
	  																					 ingredients_attributes: {0 => {name: "Meat"}, 1 => {name: "Marinade"}, 2 => {name: ""}}}
	  end
	  assert_template 'pages/index'
	  Recipe.last.ingredients.each do |i|
	  	refute_equal(i.name, "", "Failed to delete empty ingredient")
	  end
  end
end
