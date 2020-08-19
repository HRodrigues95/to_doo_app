class TodosController < ApplicationController
  before_action :logged_in_user, only: [:create, :update, :destroy]

  def create
    @todo = current_list.todos.build(todo_params)
    if @todo.save
      flash[:success] = 'To do added!'
    end
    redirect_to current_list
  end

  def destroy
    puts 'In destroy method ToDo Controller'
    @todo = Todo.find_by(id: params[:id])
    @todo.destroy
    flash[:sucess] = 'To do deleted!'
    redirect_to current_list
  end

  def update
    debugger
    @todo = Todo.find_by(id: params[:id])
    if !params[:todo].nil?
      @todo.dolist_id = params[:todo][:dolist_id]
    else
      @todo.done = !@todo.done
    end
    if @todo.save
      puts @todo
      flash[:success] = 'To do updated!'
    end
    redirect_to dolist_path(current_list)
  end

  private

  def todo_params
    params.require(:todo).permit(:description, :all_tags, :do_date)
  end

  def tag_params
    params.require(:ref_tags).permit(:tags)
  end

  def current_list
    if logged_in? && !session[:dolist_id].nil?
      @list = Dolist.find_by(id: session[:dolist_id])
    end
  end
end
