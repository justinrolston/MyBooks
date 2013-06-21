require 'spec_helper'

describe Book do
  describe 'Import Openlibrary Data' do
    context 'No OpenLibrary Data' do
      it 'book should have no data set' do
        @book = Book.new
        @author = Author.new(:name => 'N/A').save
        @book.import_openlibrary_data(nil)
        @book.author.name.should =="N/A"
      end
    end
  end
end
