class Tweet < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  validates :image, presence: true, if: -> { content.blank? }
end
