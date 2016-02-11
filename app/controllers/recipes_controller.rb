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

	def edit
		@recipe = Recipe.find(params[:id])
		(20 - @recipe.ingredients.count).times do
			@recipe.ingredients.build
		end
	end

	def update
		@recipe = Recipe.find(params[:id])
		if @recipe.update_attributes(safe_params)
			flash[:success] = "Recipe updated successfully"
			redirect_to index_path(id: @recipe.id)
		else
			flash[:danger] = "Something went wrong. Did you select a category? Leave out the title?"
			redirect_to edit_path(id: @recipe.id)
		end
	end
	
private

	def safe_params
		params.require(:recipe).permit(:title, :instruction, :category_id, ingredients_attributes: [:id, :name, :_destroy])
	end

end
