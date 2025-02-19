class CreateArticles < ActiveRecord::Migration[8.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.date :uploaded_at
      t.string :type

      t.timestamps
    end
  end
end
