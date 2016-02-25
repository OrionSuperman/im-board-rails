class CreateEventaddresses < ActiveRecord::Migration
  def change
    create_table :eventaddresses do |t|
      t.references :event, index: true, foreign_key: true
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.integer :zipcode
      t.float :lat
      t.float :lng

      t.timestamps null: false
    end
  end
end
