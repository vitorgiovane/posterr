class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :content, limit: 777
      t.belongs_to :user, foreign_key: true, null: false
      t.references :parent, foreign_key: { to_table: :posts }
      
      t.timestamps
      t.datetime :deleted_at
    end
  end
end
