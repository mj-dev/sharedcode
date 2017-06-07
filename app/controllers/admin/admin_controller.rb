class Admin::AdminController < ApplicationController

before_filter :require_authentication
layout 'admin'
include SessionsHelper


  def index
    # Used as homepage for the administration of the website.
  end


  protected

  def require_authentication
    unless logged_in?
      redirect_to login_url
    end
  end

end
