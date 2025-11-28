class CreateAudios < ActiveRecord::Migration[8.0]
  def change
    create_table :audios do |t|
      t.string :title
      t.date :uploaded_at

      t.timestamps
    end
  end
end
