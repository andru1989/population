class AddColumnToPeople < ActiveRecord::Migration
  def change
    enable_extension "hstore"
    add_column :people, :work_experience, :hstore
    add_index :people, :work_experience, using: :gin
  end
end
