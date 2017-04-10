class Category < ApplicationRecord
  belongs_to :image
  has_many :article
end
