class Following < ApplicationRecord
  include ActiveModel::Validations

  belongs_to :follower_user, foreign_key: :follower_user_id, class_name: 'User'
  belongs_to :followed_user, foreign_key: :followed_user_id, class_name: 'User'

  validates :follower_user, presence: true
  validates :followed_user, presence: true

  validates_with FollowingValidator
end
