class CreateMultigalleries < ActiveRecord::Migration[8.0]
  def change
    create_table :multigalleries do |t|
      t.date :uploaded_at

      t.timestamps
    end
  end
end
