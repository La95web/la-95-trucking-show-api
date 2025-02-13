class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :stripe_id
      t.string :title
      t.text :description
      t.integer :price
      t.boolean :featured, default: false

      t.timestamps
    end
    add_index :products, :stripe_id, unique: true
  end
end
