class KeywordsController < ApplicationController


  def index
    @keyword = Keyword.all
    @keyword = @keyword.group_by { |keyword| keyword.keyword }.sort_by { |k, v| k.length }
    render json: @keyword
  end
  

  # POST /keywords
  def create
    @keyword = Keyword.new(keyword_params)
  
    if @keyword.save
      render json: {message: 'Keyword successfully created.'}, state:200
    else
      render error: {error:'Unable to create Keyowrd.'}, status:400
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
    params.require(:keyword).permit(:user_id, :keyword)
  end

end
