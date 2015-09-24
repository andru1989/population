class AddColumnToPeople < ActiveRecord::Migration
  def change
    add_column :people, :work_experience, :hstore
  end
end
