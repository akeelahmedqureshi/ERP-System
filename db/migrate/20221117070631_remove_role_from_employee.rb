class RemoveRoleFromEmployee < ActiveRecord::Migration[7.0]
  def change
    remove_column :employees, :role, :string
  end
end
