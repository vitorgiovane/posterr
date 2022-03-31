class User < ApplicationRecord
  acts_as_paranoid
  has_many :posts, dependent: :destroy

  validates :username, length: {maximum: 14}, allow_blank: false, format: { with: /\A[a-z]+_?[a-z]+\z/ }
end
