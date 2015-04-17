class BooksController < ApplicationController
  before_action :logged_in_user, only: [:index, :create, :destroy]
  before_action :correct_user,   only: :destroy

  def index
    @books = Book.paginate(page: params[:page]).order('title ASC')
  end

  def setup
    @book = books(:book_one)
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @library = current_user.library

    if @book.save
      @book.catalogs.create(:library_id => @library.id)
      flash[:success] = "Book added to library!"
      redirect_to root_url
    else
      render 'welcome/home'
    end
  end

  def destroy
    @book.destroy
    flash[:success] = "Book deleted"
    redirect_to request.referrer || current_user
  end

  private
    def book_params
      params.require(:book).permit(:title, :author, :publisher, :isbn, :format, :location, shelf_ids: [])
    end

    def correct_user
      @book = current_user.library.books.find_by(id: params[:id])
      redirect_to current_user if @book.nil?
    end
end
