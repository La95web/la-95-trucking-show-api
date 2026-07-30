class CreateAcademyRegistrations < ActiveRecord::Migration[8.0]
  def change
    create_table :academy_registrations do |t|
      t.string :full_name
      t.string :email
      t.string :phone
      t.string :has_cdl
      t.string :driving_experience

      t.timestamps
    end
  end
end
