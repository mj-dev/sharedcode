class User < ActiveRecord::Base
  has_many :article
  has_secure_password
end
