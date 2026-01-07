class AddFieldsToArticles < ActiveRecord::Migration[8.0]
  def change
    add_column :articles, :titlevideo, :string
    add_column :articles, :description, :text
  end
end
