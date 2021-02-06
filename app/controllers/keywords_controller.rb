class KeywordsController < ApplicationController
  def index
    @keyword = Keyword.all
    render json: @keyword
  end


  # POST /keywords
  def create
    @keyword = Keyword.new(user_params)
    if @keyword.save
      render json: @keywrod
    else
      render error: {error:'Unable to create Keyowrd.'}, status:400
    end

  end
  
  
  # DELETE /keywords/:id
  def destroy
    @keyword = Keyword.find(params[:id])
    
    if @keyword
      @keyword.destroy
      render json: {message: 'Keyword successfully deleted.'}, state:200
    else
      render error: {error:'Unable to delete Keyowrd.'}, status:400
    end

  end
  
  private

  def keyword_params
    params.require(:keyword).permit(:user_id, :keyword)
  end

end
