class ApplicationController < ActionController::Base

  # current_user is now accessible in both controllers and views.
  helper_method :current_user


  protected

  # Return the current user.
  def current_user
    # ...
  end

  # Require logged in user.
  def require_user
    # ...
  end

  # Require logged out user.
  def require_no_user
    # ...
  end

end