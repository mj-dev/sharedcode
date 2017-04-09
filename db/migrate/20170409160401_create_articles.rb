class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :name
      t.string :content
      t.integer :image_id
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
