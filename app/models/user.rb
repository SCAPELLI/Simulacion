class User < ApplicationRecord
  has_many :movies
  
  has_secure_password
end
