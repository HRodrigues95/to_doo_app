class TaglinksController < ApplicationController
  def create
    # Be careful: on a live environment, this halts everything
    debugger
    # Again, use `find_by!` instead to return
    # a 404 or explicitly handle nil
    @todo = Todo.find_by(id: params[:todo_id])
    @taglink = @todo.taglist
  end

  # Remove if unused
  def destroy
  end
end
