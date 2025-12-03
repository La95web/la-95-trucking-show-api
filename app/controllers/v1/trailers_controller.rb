class V1::TrailersController < ApplicationController
  load_and_authorize_resource

  def index; end

  def show; end

  def create
    if @trailer.save
      render :show, status: :created
    else
      render json: { error: @trailer.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  def update
    if @trailer.update(trailer_params)
      head :no_content
    else
      render json: { error: @trailer.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  def destroy
    @trailer.destroy
  end

  private

  def trailer_params
    params.require(:trailer).permit(:title, :content, :type, :uploaded_at, :main_image, :thumbnail)
  end
end
