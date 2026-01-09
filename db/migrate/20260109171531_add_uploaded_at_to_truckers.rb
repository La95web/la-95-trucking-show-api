class AddUploadedAtToTruckers < ActiveRecord::Migration[8.0]
  def change
    add_column :truckers, :uploaded_at, :date
  end
end
