class Movie < ApplicationRecord
  serialize :sources, Hash

  belongs_to :user

  validates :url, presence: true
end
