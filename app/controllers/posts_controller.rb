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


  private

  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end


  def send_alert(post)
    @keywords = Keyword.get_distinct_keywords
    # p @keywords

    @arr = Array.new

    for k in @keywords.keys
      # p k
      if post.title.include? k # 제목만 체크
        for user in @keywords[k]
          p "alert keyword[" + user.keyword_name + "] to user " + user.user_id 
          @arr << { :keyword_name => user.keyword_name, :user_id => user.user_id }
        end
      end
    end

    return @arr
  end

end
