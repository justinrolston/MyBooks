require 'openlibrary'

ActiveAdmin.register Book do
  controller do
    def create
      @book = Book.new(params[:book])
      data = Openlibrary::Data
      book_details = data.find_by_isbn(@book.isbn10)
      if book_details.nil?
        respond_to do |f|
          f.html { flash[:alert] = 'Cannot find book'
                   render action: "new"}
        end
      else
        @book.import_openlibrary_data(book_details)
        respond_to do |f|
          if @book.save
            f.html { redirect_to :admin_books, notice: "Book was Created" }
          else
            f.html {render action: "new" }
          end
        end
      end
    end
  end
end
