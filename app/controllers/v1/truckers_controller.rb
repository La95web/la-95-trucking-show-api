class V1::TruckersController < ApplicationController
  load_and_authorize_resource

  def index; end

  def show; end

  def create
    if @trucker.save
      render :show, status: :created
    else
      render json: { error: @trucker.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  def update
    if @trucker.update(trucker_params)
      head :no_content
    else
      render json: { error: @trucker.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  def destroy
    @trucker.destroy
  end

  private

  def trucker_params
    params.require(:trucker).permit(:company, :description, :location, :salary, :experience, :requirements, :qualities, :language, :main_image, :thumbnail, :uploaded_at)
  end
end
