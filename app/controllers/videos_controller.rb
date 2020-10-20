class VideosController < ApplicationController
  def index
    @videos = ZypeRequests.new.videos(index_params[:page])
  end

  def index_params
  	params.permit(:page)
  end
end
