class CreateCommentaries < ActiveRecord::Migration[5.0]
  def change
    create_table :commentaries do |t|
      t.string :mail
      t.string :content
      t.integer :article_id

      t.timestamps
    end
  end
end
