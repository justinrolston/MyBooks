class Book < ActiveRecord::Base
  attr_accessible :description, :isbn10, :isbn13, :title, :subtitle, :author_id
  belongs_to :author

  self.per_page = 5

  def import_openlibrary_data( data)
    binding.pry
    self.title = data.title unless data.title.nil?
    self.author = data.authors.first['name'] unless data.authors.nil?
    self.subtitle = data.subtitle
    self.isbn10 = data.identifiers['isbn_10'].first unless data.identifiers['isbn_10'].nil?
    self.isbn13 = data.identifiers['isbn_13'].first unless data.identifiers['isbn_13'].nil?
  end
end
