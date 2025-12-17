class AddTypeToMultigalleries < ActiveRecord::Migration[8.0]
  def change
    add_column :multigalleries, :type, :string
  end
end
