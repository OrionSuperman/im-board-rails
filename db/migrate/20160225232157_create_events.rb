class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.text :about
      t.integer :seats
      t.references :user, index: true, foreign_key: true
      t.boolean :open

      t.timestamps null: false
    end
  end
end
