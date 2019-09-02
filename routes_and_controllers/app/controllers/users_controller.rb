class UsersController < ApplicationController

  def index
    render json: User.all
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    user = User.find(params[:id])
    if user
      render json: user
    else
      render json: user.errors.full_messages, status: :not_found
    end
  end

  def update
    user = User.find(params[:id])
    # debugger
    if user.update(user_params)
      render json: user
    else
      render json: user.errors.full_messages, status: 422
    end
  end

  def destroy
    user = User.find(params[:id])
    if user
      user.destroy
      redirect_to users_url
    else
      render json: 'User not found', status: 404
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:email)
  end

end