class ChangePeopleColumns < ActiveRecord::Migration
  def change
    change_column_null :people, :identification_type, false
    change_column_null :people, :identification, false
    change_column_null :people, :name, false
    change_column_null :people, :last_name, false
    change_column_null :people, :city_id, false

    add_index :people, :identification, unique: true
  end
end
