class Book < ActiveRecord::Base
  attr_accessible :author, :description, :isbn10, :isbn13, :title, :title_long

  self.per_page = 3

  def import_openlibrary_data( data)
    self.title = data.title unless data.title.nil?
    self.author = data.authors.first['name'] unless data.authors.nil?
    self.title_long = data.subtitle
    self.isbn10 = data.identifiers['isbn_10'].first unless data.identifiers['isbn_10'].nil?
    self.isbn13 = data.identifiers['isbn_13'].first unless data.identifiers['isbn_13'].nil?
  end
end
