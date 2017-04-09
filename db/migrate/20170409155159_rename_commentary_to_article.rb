class RenameCommentaryToArticle < ActiveRecord::Migration[5.0]
  def change
    rename_table :article, :articles
  end
end
