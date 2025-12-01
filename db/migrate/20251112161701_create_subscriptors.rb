class CreateSubscriptors < ActiveRecord::Migration[8.0]
  def change
    create_table :subscriptors do |t|
      t.string :full_name
      t.string :email
      t.string :qr_id
      t.integer :status
      t.string :square_subscription_id

      t.timestamps
    end
  end
end
