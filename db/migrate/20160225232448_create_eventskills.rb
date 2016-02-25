class CreateEventskills < ActiveRecord::Migration
  def change
    create_table :eventskills do |t|
      t.references :event, index: true, foreign_key: true
      t.references :skilllevel, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
