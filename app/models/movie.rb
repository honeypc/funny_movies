class Movie < ApplicationRecord
  serialize :sources, Hash

  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :url, presence: true
end
