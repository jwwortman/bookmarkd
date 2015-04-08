class LibrariesController < ApplicationController

  def index
    @libraries = Library.paginate(page: params[:page])
  end

  def setup
    @library = libraries(:jacob_lib)
  end

  def show
    @library = Library.find(params[:id])
  end
end
