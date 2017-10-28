class Tweet < ApplicationRecord
  belongs_to :user
  has_many :watch_laters
  has_many :watch_laters_users, through: :watch_laters, source: :tweet
  validates :content, presence: true
  validates :image, presence: true, if: -> { content.blank? }
  mount_uploader :image, ImageUploader
end
