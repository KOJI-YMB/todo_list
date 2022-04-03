class Api::V1::PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    render json: Post.all
  end

  def show
    render json: @post
  end

  def create
    new_post = Post.new(post_params)
    if new_post.save
      render json: new_post
    else
      render json: new_post.erros, status: 422
    end
  end

  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.erros, status: 422
    end
  end

  def destroy
    @post.destroy
    render json: @post
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:name, :content)
  end

end
