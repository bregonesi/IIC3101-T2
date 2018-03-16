class AddNumCommToNews < ActiveRecord::Migration[5.1]
  def change
    add_column :news, :ncom, :int, default: 0
  end
end
