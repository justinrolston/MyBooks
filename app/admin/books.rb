require 'openlibrary'

ActiveAdmin.register Book do
  index do
    column :title
    column do |book|
      link_to image_tag(book.small_image)
    end
    column :isbn10
    column :isbn13
    default_actions
  end
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
      @book.import_openlibrary_data(book_details)
      if @book.save
        redirect_to :action => 'edit', :id => @book.id, notice: "Book was Created" 
      else
        render action: "new" 
      end
    end
  end
end
