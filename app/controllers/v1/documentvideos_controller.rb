class V1::DocumentvideosController < ApplicationController
  load_and_authorize_resource

  def index; end

  def show; end

  def create
    if @documentvideo.save
      render :show, status: :created
    else
      render json: { error: @documentvideo.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  def update
    if @documentvideo.update(documentvideo_params)
      head :no_content
    else
      render json: { errors: @documentvideo.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  def destroy
    @documentvideo.destroy
    head :no_content
  end

  private

  def documentvideo_params
    params.require(:documentvideo).permit(:titlevideo, :description, :type, :uploaded_at, :video, :poster)
  end
end
