class V1::TipsController < ApplicationController
  load_and_authorize_resource

  def index; end

  def show; end

  def create
    if @tip.save
      render :show, status: :created
    else
      render json: @tip.errors, status: :unprocessable_entity
    end
  end

  def update
    if @tip.update(tip_params)
      head :no_content
    else
      render json: @tip.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @tip.destroy
  end

  private

  def tip_params
    params.require(:tip).permit(:title, :type, :uploaded_at, :main_image, :thumbnail)
  end
end
