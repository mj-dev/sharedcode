class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(login: params[:session][:login].downcase)
    if user && user.authenticate(params[:session][:password]) && user.active
      log_in user
      redirect_to admin_root_url , notice: 'Authentification réussie'
    else
      redirect_to login_url, notice: 'Email ou mot de passe incorrect'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
