class CreateOwners < ActiveRecord::Migration[8.0]
  def change
    create_table :owners do |t|
      t.string :company
      t.text :description
      t.string :location
      t.string :salary
      t.string :experience
      t.text :qualities
      t.date :uploaded_at
      t.integer :language, default: 0

      t.timestamps
    end
  end
end
