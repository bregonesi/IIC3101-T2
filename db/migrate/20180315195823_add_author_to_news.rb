class AddAuthorToNews < ActiveRecord::Migration[5.1]
  def change
    add_reference :news, :user, foreign_key: true
  end
end
