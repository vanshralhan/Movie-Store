class Comment < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :movie, dependent: :destroy

  validates_presence_of :body
end
