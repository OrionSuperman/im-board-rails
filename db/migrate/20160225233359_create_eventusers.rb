class CreateEventusers < ActiveRecord::Migration
  def change
    create_table :eventusers do |t|
      t.references :event, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.boolean :accepted
      t.boolean :pending

      t.timestamps null: false
    end
  end
end
