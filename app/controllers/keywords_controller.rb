class KeywordsController < ApplicationController


  def index
    @keywords = Keyword.get_distinct_keywords
    render json: @keywords
  end
  

  # POST /keywords
  def create
    @keyword = Keyword.new(keyword_params)
  
    if @keyword.save(validate: true)
      render json: {message: 'Keyword successfully created.'}, state:200
    else
      render json: {message: 'Unable to create Keyowrd.'}, status: 400
    end

    rescue ActiveRecord::RecordNotUnique => e
      render json: {message: 'Keyword already exists.'}, status: 400
  end
  

  # DELETE /keywords/:id
  def destroy
    @keyword = Keyword.find(params[:id])
    
    if @keyword.destroy
      render json: {message: 'Keyword successfully deleted.'}, state:200
    else
      render error: {error:'Unable to delete Keyowrd.'}, status:400
    end

    rescue ActiveRecord::RecordNotFound => e
      render json: {message: 'Keyword does not exist.'}, status: 400
  end


  private

  def keyword_params
    params.require(:keyword).permit(:user_id, :keyword_name)
  end

end
