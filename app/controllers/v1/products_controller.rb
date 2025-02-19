class V1::ProductsController < ApplicationController
  load_and_authorize_resource

  def index; end

  def show; end

  def create
    if @product.save
      render :show, status: :created
    else
      render json: { error: @product.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      head :no_content
    else
      render json: { error: @product.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    head :no_content
  end

  def featured
    @products = @products.where(featured: true)
    render :index, status: :ok
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :stripe_id, :featured, :language, :main_image, gallery: [])
  end
end
