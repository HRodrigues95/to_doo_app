module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  # Returns true if the given user is the current user.
  def current_user?(user)
    # No need to check `user && ...`, since `nil == #<User...>` is false
    # Also, if you need to check non booleans, always do `some_var.present?`
    user && user == current_user
  end

  def logged_in?
    # Avoid double negatives
    session[:user_id].present?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end

  # This method's name doesn't reflect what it's doing
  # Also, since it's only being used on one place, it can be inlined
  def update_dolist(dolist)
    session[:dolist_id] = dolist.id
  end

  def current_list
    @current_list ||= Dolist.find_by(id: session[:dolist_id]) if session[:user_id] && session[:dolist_id]
    puts @current_list # Debugging code should be removed (just search for puts on the whole project)
  end
end
