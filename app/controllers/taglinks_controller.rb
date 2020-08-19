class TaglinksController < ApplicationController
  def create
    debugger
    @todo = Todo.find_by(id: params[:todo_id])
    @taglink = @todo.taglist
  end

  def destroy
  end
end
