class PagesController < ApplicationController
  def home
  end

  def index
  	@recipe = Recipe.find(params[:id])
  end

  def display
  	@category = Category.find(params[:id])
  	@recipes = Recipe.where(category_id: params[:id]).sort_by{|r| r.title}
  end

  def display_alpha
  end

  def search_results
    @recipes = Recipe.search(params[:search])
  end

  def display_letter
  	@alpha_sorted_recipes = Recipe.all.sort_by{|r| r.title}
  	@letter = params[:id]
  end

end
