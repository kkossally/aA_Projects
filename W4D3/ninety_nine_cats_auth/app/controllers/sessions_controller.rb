class SessionsController < ApplicationController
  # before_action :ensure_logged_in, only:[:destroy, :create]

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if user
      login_user!(user)
    else
      flash.now[:errors] = ["Invalid credentials"]
      render :new
    end
  end

  def destroy
    log_out!
  end

end