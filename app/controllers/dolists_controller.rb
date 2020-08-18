class DolistsController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :create, :destroy]
  
  def index
    @dolists = current_user.lists
  end

  def show
    @dolist = Dolist.find_by(id: params[:id])
    update_dolist(@dolist)
    @todos  = @dolist.todos
    @todo   = Todo.new
  end

  def new
    @dolist = Dolist.new
  end

  def create
    @dolist = current_user.dolists.build(list_params)
    if @dolist.save
      flash[:success] = 'Created a new List'
      redirect_to dolists_path
    else
      render 'new' # recals the new method
    end
  end

  def destroy
    @dolist = Dolist.find_by(id: params[:id])
    if @dolist.destroy
      flash.now[:success] = 'List was successfully deleted.'
      redirect_to dolists_path
    else
      flash.now[:error] = 'Something went wrong'
      redirect_to dolist_path(@dolist)
    end
  end

  private

  def list_params
    params.require(:dolist).permit(:name)
  end
end
