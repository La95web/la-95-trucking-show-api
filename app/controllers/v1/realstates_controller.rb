class V1::RealstatesController < ApplicationController
  load_and_authorize_resource

  def index; end

  def show; end

  def create
    if @realstate.save
      render :show, status: :created
    else
      render json: { error: @realstate.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  def update
    if @realstate.update(realstate_params)
      head :no_content
    else
      render json: { error: @realstate.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  def destroy
    @realstate.destroy
  end

  private

  def realstate_params
    params.require(:realstate).permit(:price, :rooms, :location, :internet, :parking, :furniture, :description, :main_image, :thumbnail, :uploaded_at, :language)
  end
end
