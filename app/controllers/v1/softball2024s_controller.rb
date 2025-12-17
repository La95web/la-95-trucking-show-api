class V1::Softball2024sController < ApplicationController
  load_and_authorize_resource

  def index
    @softball2024s = Softball2024.all
  end

  def show; end

  def create
    @softball2024 = Softball2024.new(softball2024_params)

    if @softball2024.save
      render :show, status: :created
    else
      render json: { error: @softball2024.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  def update
    if @softball2024.update(softball2024_params)
      render :show
    else
      render json: { error: @softball2024.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  def destroy
    @softball2024.destroy
    head :no_content
  end

  private

  def softball2024_params
    params.require(:softball2024).permit(
      :uploaded_at,
      :poster,
      video: [],
      thumbnail: [],
      gallery: []
    )
  end
end
