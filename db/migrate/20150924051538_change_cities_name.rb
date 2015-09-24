class ChangeCitiesName < ActiveRecord::Migration
  def change
    change_column_null :cities, :name, false
    add_index :cities, :name, unique: true
  end
end
