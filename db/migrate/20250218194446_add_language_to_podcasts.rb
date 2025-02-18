class AddLanguageToPodcasts < ActiveRecord::Migration[8.0]
  def change
    add_column :podcasts, :language, :integer, default: 0
  end
end
