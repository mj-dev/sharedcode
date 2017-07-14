class Admin::AdminController < ApplicationController

before_filter :require_authentication
layout 'admin'
include SessionsHelper


  def index
  end


  protected

  def require_authentication
    unless logged_in?
      redirect_to login_url
    end
  end

end
