class AddNameAndPhotoToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :photo, :string
    add_column :users, :dob, :string
  end
end
