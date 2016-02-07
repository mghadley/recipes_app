class RecipesController < ApplicationController

	def new
		@recipe = Recipe.new
		20.times do
      @recipe.ingredients.build
    end
	end

	def create
		@recipe = Recipe.new(safe_params)
		if @recipe.save
			flash[:success] = "Recipe created successfully"
			redirect_to index_path(id: @recipe.id)
		else
			flash[:danger] = "#{@recipe.title.titleize} recipe already exists"
			redirect_to new_path
		end
	end

private

	def safe_params
		params.require(:recipe).permit(:title, :instruction, :category_id, ingredients_attributes: [:name])
	end

end
