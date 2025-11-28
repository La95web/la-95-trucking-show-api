class AddParagraphsToMarketplaces < ActiveRecord::Migration[8.0]
  def change
    add_column :marketplaces, :paragraphs, :string
  end
end
