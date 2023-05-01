# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts, inverse_of: :creator, dependent: :destroy, foreign_key: :creator_id
  has_many :post_likes, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
