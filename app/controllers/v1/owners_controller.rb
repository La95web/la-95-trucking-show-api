class V1::OwnersController < ApplicationController
  load_and_authorize_resource

  def index; end

  def show; end

  def create
    if @owner.save
      render :show, status: :created
    else
      render json: { error: @owner.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  def update
    if @owner.update(owner_params)
      head :no_content
    else
      render json: { error: @owner.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  def destroy
    @owner.destroy
  end

  private

  def owner_params
    params.require(:owner).permit(:company, :description, :location, :salary, :experience, :qualities, :language, :main_image, :thumbnail, :uploaded_at)
  end
end
