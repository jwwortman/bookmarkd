class LibrariesController < ApplicationController
   before_action :logged_in_user, only: [:index, :edit, :update, :destroy,
                                        :books, :shelves]
  def setup
    @library = libraries(:jacob_lib)
  end

  def index
    @libraries = Library.paginate(page: params[:page])
  end

  def show
    @library = Library.find(params[:id])
  end

  def books
    @library = Library.find(params[:id])
    @title = "#{@library.user.name}'s Books"
    @books = @library.books.paginate(page: params[:page])
    @book = current_user.library.books.build if logged_in?
    render 'show_books'
  end

  def shelves
    @library = Library.find(params[:id])
    @title = "#{@library.user.name}'s Shelves"
    @shelves = @library.shelves.paginate(page: params[:page])
    @shelf = current_user.library.shelves.build if logged_in?
    render 'show_shelves'
  end
end