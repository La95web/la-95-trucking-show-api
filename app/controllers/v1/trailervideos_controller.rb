class V1::TrailervideosController < ApplicationController
  load_and_authorize_resource

  def index; end

  def show; end

  def create
    if @trailervideo.save
      render :show, status: :created
    else
      render json: { error: @trailervideo.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  def update
    if @trailervideo.update(trailervideo_params)
      head :no_content
    else
      render json: { errors: @trailervideo.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  def destroy
    @trailervideo.destroy
    head :no_content
  end

  private

  def trailervideo_params
    params.require(:trailervideo).permit(:titlevideo, :description, :type, :uploaded_at, :video, :poster)
  end
end
