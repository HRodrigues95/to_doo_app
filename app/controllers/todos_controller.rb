class TodosController < ApplicationController
  before_action :logged_in_user, only: [:create, :update, :destroy]

  def create
    @todo = current_list.todos.build(todo_params)
    # Although this is fine, a more idiomatic way would be:
    # flash[:success] = 'To do added!' if @todo.save
    if @todo.save
      flash[:success] = 'To do added!'
    end
    redirect_to current_list
  end

  def destroy
    # Always check for debugging code
    puts 'In destroy method ToDo Controller'
    @todo = Todo.find_by(id: params[:id])
    # You're not properly handling the result of `destroy`
    # If it returns false, you're still considering everything worked out ok
    @todo.destroy
    flash[:sucess] = 'To do deleted!'
    redirect_to current_list
  end

  def update
    # Again, this would halt the request
    debugger
    @todo = Todo.find_by(id: params[:id])
    if !params[:todo].nil? # Prefer `params[:todo].present?`
      @todo.dolist_id = params[:todo][:dolist_id]
    else
      @todo.done = !@todo.done
    end

    # Instead of this flow, you could've done
    # if @todo.update(update_params)
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
