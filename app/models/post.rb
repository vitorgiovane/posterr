class Post < ApplicationRecord
  acts_as_paranoid
  belongs_to :user

  validates :content, presence: true, length: {maximum: 777}
end
