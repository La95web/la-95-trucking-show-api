class V1::SectionsController < ApplicationController
  load_and_authorize_resource :article
  load_and_authorize_resource :section, through: :article, shallow: true

  def create
    if @section.save
      render status: :created
    else
      render json: { error: @section.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  def update
    if @section.update(section_params)
      head :no_content
    else
      render json: { error: @section.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  def destroy
    @section.destroy
    head :no_content
  end

  private

  def section_params
    params.require(:section).permit(:heading, :body, :image)
  end
end
