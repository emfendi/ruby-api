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


    private

    def post_params
      params.require(:post).permit(:title, :content, :user_id)
    end


end
