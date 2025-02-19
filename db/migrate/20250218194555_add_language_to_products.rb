class AddLanguageToProducts < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :language, :integer, default: 0
  end
end
