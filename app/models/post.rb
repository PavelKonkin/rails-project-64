# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :post_likes, dependent: :destroy

  validates :title, :body, presence: true
  validates :title, length: { minimum: 5 }
  validates :body, length: { minimum: 50 }
end
