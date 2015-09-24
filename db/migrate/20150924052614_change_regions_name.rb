class ChangeRegionsName < ActiveRecord::Migration
  def change
    change_column_null :regions, :name, false
    add_index :regions, :name, unique: true
  end
end
