class PagesController < ApplicationController
  def home
  end

  def index
  	@recipe = Recipe.find(params[:id])
  end

  def display
  	@category = Category.find(params[:id])
  	@recipes = Recipe.where(category_id: params[:id])
  end
end
