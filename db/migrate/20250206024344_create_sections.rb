class CreateSections < ActiveRecord::Migration[8.0]
  def change
    create_table :sections do |t|
      t.string :heading
      t.text :body
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
