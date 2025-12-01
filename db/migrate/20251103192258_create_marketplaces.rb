class CreateMarketplaces < ActiveRecord::Migration[8.0]
  def change
    create_table :marketplaces do |t|
      t.string :title
      t.date :uploaded_at
      t.text :content
      t.integer :language

      t.timestamps
    end
  end
end
