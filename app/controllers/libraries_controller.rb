class LibrariesController < ApplicationController

  def setup
    @library = libraries(:jacob_lib)
  end

  def index
    @libraries = Library.paginate(page: params[:page])
  end

  def show
    @library = Library.find(params[:id])
  end
end
