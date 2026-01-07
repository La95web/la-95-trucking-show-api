class V1::ArticlesController < ApplicationController
  load_and_authorize_resource

  def index; end

  def show; end

  def create
    if @article.save
      render :show, status: :created
    else
      render json: { error: @article.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  def update
    if @article.update(article_params)
      head :no_content
    else
      render json: { error: @article.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    head :no_content
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :type, :uploaded_at, :language, :main_image, :thumbnail, :description, :titlevideo, :video, :poster)
  end
end
