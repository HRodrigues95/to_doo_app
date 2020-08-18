module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  # Returns true if the given user is the current user.
  def current_user?(user)
    user && user == current_user
  end

  def logged_in?
    !session[:user_id].nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end

  def update_dolist(dolist)
    session[:dolist_id] = dolist.id
  end

  def current_list
    if session[:user_id] && session[:dolist_id]
      @current_list ||= Dolist.find_by(id: session[:dolist_id])
      puts @current_list
    end
  end
end
