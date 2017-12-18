class AddCounterCacheToMovie < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :view_count, :integer
  end
end
