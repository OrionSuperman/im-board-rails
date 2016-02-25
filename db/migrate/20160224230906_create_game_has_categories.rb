class CreateGameHasCategories < ActiveRecord::Migration
  def change
    create_table :game_has_categories do |t|
      t.references :game, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
