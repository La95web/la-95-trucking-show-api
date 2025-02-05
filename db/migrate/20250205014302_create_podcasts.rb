class CreatePodcasts < ActiveRecord::Migration[8.0]
  def change
    create_table :podcasts do |t|
      t.string :title
      t.date :uploaded_at
      t.string :video_url

      t.timestamps
    end
  end
end
