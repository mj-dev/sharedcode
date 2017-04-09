class AddImageToCategories < ActiveRecord::Migration[5.0]
  def change
    add_reference :categories, :image, foreign_key: true
  end
end
