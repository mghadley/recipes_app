class AddIndexToRecipesTitle < ActiveRecord::Migration
  def change
  	add_index :recipes, :title, unique: true
  end
end
