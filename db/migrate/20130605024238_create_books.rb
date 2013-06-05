class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :title_long
      t.string :isbn10
      t.string :isbn13
      t.string :author
      t.text :description

      t.timestamps
    end
  end
end
