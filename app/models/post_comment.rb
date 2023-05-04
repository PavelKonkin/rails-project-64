# frozen_string_literal: true

class PostComment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_ancestry ancestry_format: :materialized_path

  validates :content, presence: true, length: { minimum: 5, maximum: 200 }
end
