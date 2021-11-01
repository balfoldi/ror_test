class CreateUsersLikedPostsJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_table :users_liked_posts_join_table do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
