class PostsController < ApplicationController

  before_action :authenticate_user!, :only => [:new]

  def index
    @post=Post.all.reverse
  end

  def new
    @post=Post.new
  end

  def create
    @post = Post.new(post_params)
    current_user.posts<<@post
    if @post.save
      redirect_to posts_path, notice: "El post fue creado exitosamente"
    else
      render :new
    end
  end

  def show
    @post=Post.find(params[:id])
    @comment=Comment.new
    @postComments=Post.find(params[:id]).comments
  end

  def edit
    @post=Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, notice: "El post fue modificado exitosamente"
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy

    redirect_to posts_path, notice: "El post fue eliminado con éxito"
  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end
end