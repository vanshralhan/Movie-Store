class Movie < ApplicationRecord
  mount_uploader :image, MovieUploader
  validates :title, :genre, :plot,:rating, :web, presence: true
  validates_presence_of :image
  validates :rating, numericality: {less_than_or_equal_to: 10}
  has_many :views, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :users, through: :comments


  def self.search(search)
    where("title ILIKE ?", "%#{search}%")
  end



end
