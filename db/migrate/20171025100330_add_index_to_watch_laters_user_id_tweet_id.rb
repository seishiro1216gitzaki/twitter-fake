class AddIndexToWatchLatersUserIdTweetId < ActiveRecord::Migration[5.0]
  def change
    add_index :watch_laters, [:user_id, :tweet_id], unique: true
  end
end
