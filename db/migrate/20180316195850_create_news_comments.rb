class CreateNewsComments < ActiveRecord::Migration[5.1]
  def change
    create_table :news_comments do |t|
      t.references :news, foreign_key: true
      t.string :author
      t.text :comment

      t.timestamps
    end
  end
end
