class User < ApplicationRecord
  acts_as_paranoid
  has_many :posts, dependent: :destroy
  
  has_many :received_follows, foreign_key: 'followed_user_id', class_name: 'Following'
  has_many :followers, through: :received_follows, source: :follower_user

  has_many :given_follows, foreign_key: 'follower_user_id', class_name: 'Following'
  has_many :followings, through: :given_follows, source: :followed_user

  validates :username, length: {maximum: 14}, allow_blank: false, format: { with: /\A[a-z]+_?[a-z]+\z/ }
end
