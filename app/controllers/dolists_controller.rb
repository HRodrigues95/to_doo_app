class DolistsController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :create, :destroy]

  def index
    @dolists = current_user.lists
  end

  def show
    # If find_by returns nil, @dolist.destroy will error
    # Always use find_by! (throws a RecordNotFound), unless you're handling nil cases
    @dolist = Dolist.find_by!(id: params[:id])
    update_dolist(@dolist)
    apply_filter
    @todo = Todo.new
  end

  def new
    @dolist = Dolist.new
  end

  def create
    # It's preferable to do it this way
    @dolist = Dolist.new(list_params.merge(user: current_user))
    if @dolist.save
      flash[:success] = 'Created a new List'
      redirect_to dolists_path
    else
      render 'new' # recals the new method
    end
  end

  def destroy
    @dolist = Dolist.find_by!(id: params[:id])
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

  def filter_params
    params.require(:filter).permit(:tag_id, :status, :date)
  end

  def apply_filter
    if params[:filter].nil?
      @todos = @dolist.todos
    elsif !params[:filter][:tag_id].empty?
      tag = Tag.find_by!(id: params[:filter][:tag_id])
      @todos = tag.filter(params[:id], date: params[:filter][:date], done: params[:filter][:status])
    else
      @todos = @dolist.filter(done: params[:filter][:status], date: params[:filter][:date])
    end
  end
end
