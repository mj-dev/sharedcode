class Image < ApplicationRecord
  has_many :article
  has_many :category
end
