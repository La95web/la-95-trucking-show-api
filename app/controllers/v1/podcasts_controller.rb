class V1::PodcastsController < ApplicationController
  load_and_authorize_resource

  def index; end

  def show; end

  def create
    if @podcast.save
      render :show, status: :created
    else
      render json: { error: @podcast.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  def update
    if @podcast.update(podcast_params)
      head :no_content
    else
      render json: { errors: @podcast.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  def destroy
    @podcast.destroy
    head :no_content
  end

  private

  def podcast_params
    params.require(:podcast).permit(:title, :uploaded_at, :video_url, :thumbnail)
  end
end
