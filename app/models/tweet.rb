class Tweet < ApplicationRecord
  belogns_to :user
  has_many :likes
end
