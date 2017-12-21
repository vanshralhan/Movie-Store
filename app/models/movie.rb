class Movie < ApplicationRecord
  mount_uploader :image, MovieUploader
  validates :title, :genre, :plot,:rating, :web, presence: true
  validates :rating, numericality: {less_than_or_equal_to: 10}
  has_many :views
  has_many :comments
  has_many :users, through: :comments


  def self.search(search)
    where("title LIKE ?", "%#{search}%")
  end



end
