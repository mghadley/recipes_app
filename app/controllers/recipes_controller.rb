class RecipesController < ApplicationController

	def new
		@recipe = Recipe.new
		20.times do
      @recipe.ingredients.build
    end
	end

	def create
		@recipe = Recipe.new(title: safe_params[:title].titleize, instruction: safe_params[:instruction], 
												 category_id: safe_params[:category_id])
		if @recipe.save
			20.times do |i|
			  @recipe.ingredients << Ingredient.find_or_create_by(name: ingredient_params[:ingredients_attributes]["#{i}"][:name].titleize)
			end
			@recipe.ingredients.each do |i|
				i.delete if i.name.blank?
			end
			#render body: YAML::dump(ingredient_params[:ingredients_attributes][:id])
			redirect_to index_path(id: @recipe.id)
		else
			redirect_to new_path
		end
	end

private

	def safe_params
		params.require(:recipe).permit(:title, :instruction, :category_id)
	end

	def ingredient_params
		params.require(:recipe).permit(ingredients_attributes: [:name])
	end
end
