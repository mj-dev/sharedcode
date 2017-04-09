class Article < ApplicationRecord
  has_one :user
  has_one :image
  has_many :category
end
