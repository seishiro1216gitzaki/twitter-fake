class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :tweets, through: :watch_laters
  has_many :watch_laters

  has_many :following_relationships,class_name:  "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :following_relationships

  has_many :follower_relationships,class_name:  "Relationship", foreign_key: "following_id", dependent: :destroy
  has_many :followers, through: :follower_relationships

 # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    following_relationships.find_by(following_id: other_user.id)
  end
  # ユーザーをフォローする
  def follow!(other_user)
    following_relationships.create!(following_id: other_user.id)
  end
  # ユーザーをアンフォローする
  def unfollow!(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end

  mount_uploader :image, ImageUploader

end
