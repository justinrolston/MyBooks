class Book < ActiveRecord::Base
  attr_accessible :description, :isbn10, :isbn13, :title, :subtitle, :author_id, :small_image, :medium_image, :large_image
  attr_accessor :isbn
  belongs_to :author
  accepts_nested_attributes_for :author

  self.per_page = 5

  def import_openlibrary_data( data)
    self.title = data.title unless data.title.nil?
    unless data.authors.nil?
      @name = data.authors.first['name']
      @author = Author.find_by_name(@name)
      binding.pry
      if @author.nil?
        self.build_author(:name => @name )
      else
        self.author = @author
      end
    end
    self.subtitle = data.subtitle
    self.isbn10 = data.identifiers['isbn_10'].first unless data.identifiers['isbn_10'].nil?
    self.isbn13 = data.identifiers['isbn_13'].first unless data.identifiers['isbn_13'].nil?
    import_images data
    self
  end

  private
  def import_images data
    self.small_image = data.cover["small"] unless data.cover["small"].nil?
    self.medium_image = data.cover["medium"] unless data.cover["medium"].nil?
    self.large_image = data.cover["large"] unless data.cover["large"].nil?
  end
end
