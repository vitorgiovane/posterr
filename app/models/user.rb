class User < ApplicationRecord
  acts_as_paranoid

  attr_accessor :followed_by_the_current_user, :follows_the_current_user

  has_many :posts, dependent: :destroy
  
  has_many :received_follows, foreign_key: 'followed_user_id', class_name: 'Following'
  has_many :followers, through: :received_follows, source: :follower_user

  has_many :given_follows, foreign_key: 'follower_user_id', class_name: 'Following'
  has_many :followings, through: :given_follows, source: :followed_user

  validates :username, length: {maximum: 14}, allow_blank: false, format: { with: /\A[a-z]+_?[a-z]+\z/ }

  def follows_the_user?(user)
    followings.find_by_id(user.id).present?
  end

  def followed_by_the_user?(user)
    followers.find_by_id(user.id).present?
  end

  def define_relationship_with_current_user(current_user)
    @followed_by_the_current_user = followed_by_the_user?(current_user)
    @follows_the_current_user = follows_the_user?(current_user)
  end
end
