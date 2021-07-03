class User < ApplicationRecord
  has_many :movies, dependent: :destroy

  has_secure_password
end
