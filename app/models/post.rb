class Post < ApplicationRecord
  include ActiveModel::Validations

  acts_as_paranoid
  belongs_to :user
  belongs_to :parent, class_name: 'Post', foreign_key: 'parent_id', optional: true
  
  validates_length_of :content, maximum: 777, allow_blank: false, unless: :parent
  validates :user, presence: true
  validates_with PostValidator
end
