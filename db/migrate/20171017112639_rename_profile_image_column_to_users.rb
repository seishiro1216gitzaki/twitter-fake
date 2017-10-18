class RenameProfileImageColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :profile_image, :image
  end
end
