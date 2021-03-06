class PostsController < ApplicationController
  before_action :signed_in, only: [:new, :create]

  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = "Post successfully published."
      redirect_to posts_path
    else
      render 'new'
    end
  end


  private

    def post_params
      params.require(:post).permit(:title, :body)
    end

end
