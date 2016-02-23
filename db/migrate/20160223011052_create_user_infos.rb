class CreateUserInfos < ActiveRecord::Migration
  def change
    create_table :user_infos do |t|
      t.references :user, index: true, foreign_key: true
      t.string :description
      t.string :avatar
      t.text :about

      t.timestamps null: false
    end
  end
end
