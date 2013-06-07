class HomeController < ApplicationController
  def index
    @books = Book.paginate(:page => params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users}
      format.json { render :json => @users}
    end
  end
end
