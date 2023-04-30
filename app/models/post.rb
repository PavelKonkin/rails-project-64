class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :post_comments, dependent: :destroy

  validates :title, :body, presence: true
  validates :title, length: { minimum: 10 }
  validates :body, length: { minimum: 50 }
end
