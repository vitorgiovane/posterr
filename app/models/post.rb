class Post < ApplicationRecord
  acts_as_paranoid
  belongs_to :user
  belongs_to :parent, class_name: 'Post', foreign_key: 'parent_id', optional: true

  validates_length_of :content, maximum: 777, allow_blank: false, unless: :parent
end
