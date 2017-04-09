class Category < ApplicationRecord
  has_one :image
  belongs_to :article
end
