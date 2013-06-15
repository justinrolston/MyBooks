class AddImagesToBooks < ActiveRecord::Migration
  def change
    add_column :books, :small_image, :string
    add_column :books, :medium_image, :string
    add_column :books, :large_image, :string
  end
end
