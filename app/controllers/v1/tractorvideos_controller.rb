class V1::TractorvideosController < ApplicationController
  load_and_authorize_resource

  def index; end

  def show; end

  def create
    if @tractorvideo.save
      render :show, status: :created
    else
      render json: { error: @tractorvideo.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  def update
    if @tractorvideo.update(tractorvideo_params)
      head :no_content
    else
      render json: { errors: @tractorvideo.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  def destroy
    @tractorvideo.destroy
    head :no_content
  end

  private

  def tractorvideo_params
    params.require(:tractorvideo).permit(:titlevideo, :description, :type, :uploaded_at, :video, :poster)
  end
end
