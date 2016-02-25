class CreateEventgames < ActiveRecord::Migration
  def change
    create_table :eventgames do |t|
      t.references :event, index: true, foreign_key: true
      t.references :game, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
