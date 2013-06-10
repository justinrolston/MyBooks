class RenameTitleLongToSubtitle < ActiveRecord::Migration
  def change
    rename_column :books, :title_long, :subtitle
  end
end
