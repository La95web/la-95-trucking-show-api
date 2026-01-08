class V1::AllnewvideosController < ApplicationController
  load_and_authorize_resource

  def index; end

  def show; end

  def create
    if @allnewvideo.save
      render :show, status: :created
    else
      render json: { error: @allnewvideo.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  def update
    if @allnewvideo.update(allnewvideo_params)
      head :no_content
    else
      render json: { errors: @allnewvideo.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  def destroy
    @allnewvideo.destroy
    head :no_content
  end

  private

  def allnewvideo_params
    params.require(:allnewvideo).permit(:titlevideo, :description, :type, :uploaded_at, :video, :poster)
  end
end
