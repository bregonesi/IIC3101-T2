class CreateNews < ActiveRecord::Migration[5.1]
  def change
    create_table :news do |t|
      t.string :headline
      t.string :subhead
      t.text :copy
      t.datetime :date

      t.timestamps
    end
  end
end
