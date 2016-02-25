class CreateGamecategories < ActiveRecord::Migration
  def change
    create_table :gamecategories do |t|
      t.references :game, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
