class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.text :content, null: false
      t.string :image
      t.integer :likes_count

      t.timestamps
    end
  end
end
