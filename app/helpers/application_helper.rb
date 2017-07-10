module ApplicationHelper
  # Add user id on session variable
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns the current logged user (if user logged).
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Return if the user is logged
  def logged_in?
    !current_user.nil?
  end

  def admin_logged_in?
    if logged_in?
      current_user.admin == true
    end
  end

  # Log-out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def get_last_articles
    @lastarticles = Article.last(1-3)
    return @lastarticles
  end
end
