class V1::NewsController < ApplicationController
  load_and_authorize_resource

  def index; end

  def show; end

  def create
    if @news.save
      render :show, status: :created
    else
      render json: { error: @news.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  def update
    if @news.update(news_params)
      head :no_content
    else
      render json: { error: @news.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  def destroy
    @news.destroy
  end

  private

  def news_params
    params.require(:news).permit(:title, :type, :uploaded_at, :main_image, :thumbnail)
  end
end
