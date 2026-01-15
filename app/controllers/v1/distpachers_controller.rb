class V1::DistpachersController < ApplicationController
  load_and_authorize_resource

  def index; end

  def show; end

  def create
    if @distpacher.save
      render :show, status: :created
    else
      render json: { error: @distpacher.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  def update
    if @distpacher.update(distpacher_params)
      head :no_content
    else
      render json: { error: @distpacher.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  def destroy
    @distpacher.destroy
  end

  private

  def distpacher_params
    params.require(:distpacher).permit(:company, :description, :location, :salary, :experience, :requirements, :qualities, :language, :main_image, :thumbnail, :uploaded_at)
  end
end
