class V1::ArticlesController < ApplicationController
  load_and_authorize_resource

  def index; end

  def show; end

  def create
    if @article.save
      render :show, status: :created
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def update
    if @article.update(article_params)
      head :no_content
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    head :no_content
  end

  private

  def article_params
    params.require(:article).permit(:title, :type, :uploaded_at, :main_image, :thumbnail)
  end
end
