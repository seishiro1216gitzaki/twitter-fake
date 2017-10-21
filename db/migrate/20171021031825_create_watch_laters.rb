class CreateWatchLaters < ActiveRecord::Migration[5.0]
  def change
    create_table :watch_laters do |t|
      t.references :user, null:false
      t.references :tweet, null:false
      t.timestamps
    end
  end
end
