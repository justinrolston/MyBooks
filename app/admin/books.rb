require 'openlibrary'

ActiveAdmin.register Book do
  form do |f|
    f.inputs do
      if f.object.new_record?
        f.input :isbn
      else
        f.input :author,  :as => :select,      :collection => Author.all
        f.input :title
        f.input :subtitle
        f.input :isbn10
        f.input :isbn13
        f.input :description
      end
      f.actions
    end
  end

  controller do
    def create
      @book = Book.new()
      data = Openlibrary::Data
      book_details = data.find_by_isbn(params[:book][:isbn])
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
