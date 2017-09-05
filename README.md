# DB設計

## users table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: ture|
|nickname|string|null: false|
|profile_image|string||
|header_image|string||
|email|varchar|null: false, unique: true|
|password|varchar|null: false, unique: true|

### Association
-has_many :tweets  
-has_many :likes  
-has_many :like_tweets, through: :likes, source: :tweet  
-has_many :following, through: :active_relationships, source: :followed  
-has_many :followers, through: :passive_relationships, source: :follower  
-has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy  
-has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

___________________________________________________________

## tweets table

|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|image|string||
|likes_count|integer||

### Association
-belongs_to :user  
-has_many :likes, dependent: :destroy
___________________________________________________________

## relationships table

|Column|Type|Options|
|------|----|-------|
|follower_id|integer|null: false|
|followed_id|integer|null: false|

### Association
-belongs_to :follower, class_name: "User"  
-belongs_to :followed, class_name: "User"
___________________________________________________________

## likes table

|Column|Type|Options|
|------|----|-------|
|user|string|null: false, foreign_key: true|
|tweet|string|null: false, foreign_key: true|

### Association
-belongs_to :user  
-belongs_to :tweet
