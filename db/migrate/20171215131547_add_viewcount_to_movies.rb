class AddViewcountToMovies < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :count, :int8, :default => 0
  end
end
