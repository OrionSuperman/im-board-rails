class AddDescriptionAboutToUser < ActiveRecord::Migration
  def change
  	add_column('users', 'description', 'string')
  	add_column('users', 'about', 'text')
  	drop_table('user_infos')
  end
end
