class SearchController < ApplicationController
  def index
    @books = Book.where("title LIKE '%#{params[:search]}%'")
     respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @books}
      format.json { render :json => @books}
    end
  end
end
