class CreateKey < ActiveRecord::Migration
  def change
    add_foreign_key :recipes, :categories
  end
end
