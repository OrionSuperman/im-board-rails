class CreateUserHasGames < ActiveRecord::Migration
  def change
    create_table :user_has_games do |t|
      t.references :user, index: true, foreign_key: true
      t.references :game, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
