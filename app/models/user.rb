class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :tweets

  has_many :following_relationships,class_name:  "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :following_relationships

  has_many :follower_relationships,class_name:  "Relationship", foreign_key: "following_id", dependent: :destroy
  has_many :followers, through: :follower_relationships




end
