class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :last_name
      t.integer :identification_type
      t.string :identification
      t.string :address
      t.integer :gender
      t.string :phone
      t.references :city, index: true

      t.timestamps null: false
    end
  end
end
