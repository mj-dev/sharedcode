class SessionsController < ApplicationController
  include SessionsHelper
  def new
  end

  def create
    user = User.find_by(login: params[:session][:login].downcase)
    # raise user.admin.inspect
    # Use ActiveModel has_secure_password and check digest_password hash
    if user && user.authenticate(params[:session][:password]) && user.active
      log_in user
      redirect_to admin_root_url , notice: 'Authentification réussie'
    else
      # Create an error message.
      redirect_to login_url, notice: 'Email ou mot de passe incorrect'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
