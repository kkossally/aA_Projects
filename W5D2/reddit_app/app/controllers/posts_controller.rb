class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.sub_id = params[:sub_id]
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = current_user.posts.find_by(id: params[:id])
    if @post
      if @post.update_attributes(post_params)
        redirect_to post_url(@post)
      else
        flash.now[:errors] = @post.errors.full_messages
        render :edit
      end
    else
      flash[:errors] = ['Nice try, you can\'t edit this. Pal.']
      redirect_to subs_url
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to sub_url(post.sub)
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content, postsubs: [])
  end

end