class RemoveForeignKeyFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :comments, :users
    remove_foreign_key :comments, :movies
    remove_foreign_key :views, :movies
  end
end
