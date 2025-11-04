class V1::MarketplacesController < ApplicationController
 load_and_authorize_resource

  def index; end

  def show; end

  def create
    if @marketplace.save
      render :show, status: :created
    else
      render json: { error: @marketplace.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  def update
    if @marketplace.update(marketplace_params)
      head :no_content
    else
      render json: { errors: @marketplace.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  def destroy
    @marketplace.destroy
    head :no_content
  end

  private

  def marketplace_params
    params.require(:marketplace).permit(:title, :uploaded_at, :language, :content, :paragraphs, :main_image, :thumbnail)
  end
end
