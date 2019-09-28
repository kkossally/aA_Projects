class Api::SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(
      params[:user][:username], 
      params[:user][:password])

    if @user.nil?
      render json: ['Invalid username or password - Love, Kafele'], status: 401
    else
      login!(@user)
      render 'api/users/show'
    end
  end

  def destroy
    unless logged_in? 
      render json: ['Kafele says, you are not logged in'], status: 404 
    end

    logout!
    render json: {}
  end

end
