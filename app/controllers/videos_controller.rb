class VideosController < ApplicationController
  def index
    @videos = ZypeRequests.new.videos(index_params[:page], index_params[:q])
  end

  def index_params
  	params.permit(:page, :q)
  end
end
