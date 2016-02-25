class RemoveCategoryDescription < ActiveRecord::Migration
  def change
  	remove_column("categories", "description")
  end
end
