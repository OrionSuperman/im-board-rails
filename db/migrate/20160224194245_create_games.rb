class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.integer :minplayers
      t.integer :maxplayers
      t.string :length
      t.string :description
      t.text :about

      t.timestamps null: false
    end
  end
end
