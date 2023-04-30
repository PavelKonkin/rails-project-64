class PostComment < ApplicationRecord
  belongs_to :post
  has_ancestry ancestry_format: :materialized_path2

  validates :content, presence: true, length: { minimum: 5 }
end
