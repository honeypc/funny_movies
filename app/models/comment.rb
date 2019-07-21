class Comment < ApplicationRecord
  
  belongs_to :movie
  belongs_to :user

  validates :content, presence: true

  scope :ordered, -> { order("created_at DESC") }
end
