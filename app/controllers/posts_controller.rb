class PostsController < ApplicationController


  # POST /posts
  def create
    @post = Post.new(post_params)
    if @post.save
      @res = send_alert(@post)
      render json: @res
    else
      render error: {error:'Unable to create Post.'}, status:400
    end

  end


  def send_alert(post)
  
    @keywords = Keyword.all
    # @keywords = @keyword.group_by { |keyword| keyword.keyword }.sort_by { |k, v| k.length }

    @arr = Array.new

    for k in @keywords
      # p k.keyword
      if post.title.include? k.keyword
        p "alert keyword[" + k.keyword + "] to user " + k.user_id 
        @arr << { :keyword => k.keyword, :user_id => k.user_id }
      end
    end

    return @arr

  end


  private

  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end


end
