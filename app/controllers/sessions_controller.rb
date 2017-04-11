class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(login: params[:session][:login].downcase)
    # raise user.admin.inspect
    # Use ActiveModel has_secure_password and check digest_password hash
    if user && user.authenticate(params[:session][:password]) && user.active
      log_in user
      redirect_to root_url , notice: 'Successfully log in'
    else
      # Create an error message.
      redirect_to login_url, notice: 'Invalid email/password combination'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
