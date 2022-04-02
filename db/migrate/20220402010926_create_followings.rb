class CreateFollowings < ActiveRecord::Migration[7.0]
  def change
    create_table :followings, primary_key: [:follower_user_id, :followed_user_id] do |t|
      t.references :follower_user, foreign_key: { to_table: :users }
      t.references :followed_user, foreign_key: { to_table: :users }

      t.datetime :created_at, null: false
    end
  end
end
