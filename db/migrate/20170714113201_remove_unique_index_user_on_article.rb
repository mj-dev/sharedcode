class RemoveUniqueIndexUserOnArticle < ActiveRecord::Migration[5.0]
  def change
    remove_index(:articles, :name => 'index_articles_on_user_id')
    add_index :articles, :user_id
  end
end
