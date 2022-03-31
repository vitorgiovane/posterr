class User < ApplicationRecord
  validates :username, length: {maximum: 14}, allow_blank: false, format: { with: /\A[a-z]+_?[a-z]+\z/ }
end
