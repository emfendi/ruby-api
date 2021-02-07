class PostsController < ApplicationController

  
  # POST /posts
  def create
    @post = Post.new(post_params)
    if @post.save
      render json: @post
    else
      render error: {error:'Unable to create Post.'}, status:400
    end

  end


  def getPostByKeyword(keyword)
  
    # @post = Post.where('title LIKE ?', "%#{keyword}%")
    @post = Post.where('title LIKE ? OR content LIKE ?', "%#{keyword}%", "%#{keyword}%")

    if @post
      return @post
    else
      # @post = Post.where('content LIKE ?', "%#{keyword}%")

    end

    return nil

  end


  private

  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end


end
