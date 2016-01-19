class RecipesController < ApplicationController

	def new
		@recipe = Recipe.new
	end

	def create
		safe_params = params.require(:recipe).permit(:title, :instruction, :category_id)
		ingredient_params = params.require(:recipe).permit(ingredient: :name)
		@recipe = Recipe.new(safe_params)
		@recipe.save
		@recipe.ingredients.first_or_create(name: ingredient_params[:ingredient][:name])
		#render body: YAML::dump(ingredient_params)
		redirect_to index_path(id: @recipe.id)
	end
end
