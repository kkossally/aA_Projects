class SubsController < ApplicationController
  before_action :ensure_logged_in
  before_action :ensure_moderator, only: [:edit, :update]

  def index
    @subs = Sub.all
  end

  def show 
    @sub = Sub.find(params[:id])
  end 

  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.user_id = current_user.id 
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
    # @sub = Sub.find(params[:id])
    @sub = current_user.subs.find(params[:id])
    # debugger
  end

  def update
    # debugger
    @sub = current_user.subs.find(params[:id])
    if @sub.update_attributes(sub_params)
      # debugger
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      # debugger
      render :edit
    end
  end

  def ensure_moderator
    unless current_user.subs.find_by(id: params[:id])
      flash[:errors] = ['Mod up fool, nacho sub']
      redirect_to sub_url(params[:id])
    end
  end

  private 

  def sub_params
    params.require(:sub).permit(:title, :description)
  end


end