class RemoveUnusedTables < ActiveRecord::Migration
  def change
  	drop_table("user_has_games")
  	drop_table("game_has_categories")
  	drop_table("game_reviews")
  	drop_table("user_reviews")
  end
end
