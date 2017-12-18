class Movie < ApplicationRecord
  mount_uploader :image, MovieUploader
  validates :title, :genre, :plot,:rating, :web, presence: true
  validates :rating, numericality: {less_than_or_equal_to: 10}
  has_many :views   
end
