class AddImageToArticles < ActiveRecord::Migration[5.0]
  def change
    add_reference :articles, :image, foreign_key: true
  end
end
