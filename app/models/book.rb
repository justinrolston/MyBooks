class Book < ActiveRecord::Base
  attr_accessible :author, :description, :isbn10, :isbn13, :title, :title_long
end
