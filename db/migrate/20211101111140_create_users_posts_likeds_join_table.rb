class CreateUsersPostsLikedsJoinTable < ActiveRecord::Migration[6.1]
  def change
    def change
      create_table :users_posts_likeds_join_table do |t|
        t.references :user, null: false, foreign_key: true
        t.references :post, null: false, foreign_key: true

        t.timestamps
      end
      create_join_table :categories, :users

    end
  end
end
