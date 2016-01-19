class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
    	t.string :title
    	t.text :instruction
    	t.belongs_to :category, index: true
      t.timestamps null: false
    end

    create_table :ingredients_recipes do |t|
    	t.belongs_to :recipe, index: true
    	t.belongs_to :ingredient, index: true
    	t.timestamps null: false
    end
  end
end
