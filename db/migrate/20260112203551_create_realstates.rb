class CreateRealstates < ActiveRecord::Migration[8.0]
  def change
    create_table :realstates do |t|
      t.string :price
      t.text :rooms
      t.string :location
      t.string :internet
      t.string :parking
      t.text :furniture
      t.text :description
      t.date :uploaded_at
      t.integer :language, default: 0

      t.timestamps
    end
  end
end
