class KeywordsController < ApplicationController
  def index
    @keyword = Keyword.all
    render json: @keywods
  end

end
