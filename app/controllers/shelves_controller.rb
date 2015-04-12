class ShelvesController < ApplicationController
  before_action :logged_in_user, only: [:index, :create, :destroy]
  before_action :correct_user,   only: :destroy

  def index
    @shelves = Shelf.paginate(page: params[:page])
  end

  def setup
    @shelf = shelves(:orange)
  end

  def show
    @shelf = Shelf.find(params[:id])
  end

  def create
    @shelf = current_user.library.shelves.build(shelf_params)
    if @shelf.save
      flash[:success] = "Shelf created!"
      redirect_to current_user
    else
      render 'current_user'
    end
  end

  def destroy
    @shelf.destroy
    flash[:success] = "Shelf deleted"
    redirect_to request.referrer || current_user
  end

  private
    def shelf_params
      params.require(:shelf).permit(:name, :description)
    end

    def correct_user
      @shelf = current_user.library.shelves.find_by(id: params[:id])
      redirect_to current_user if @shelf.nil?
    end
end
