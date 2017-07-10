class ApplicationController < ActionController::Base
  include SessionsHelper

  # current_user is now accessible in both controllers and views.
  helper_method :current_user

end