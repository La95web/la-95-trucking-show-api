class V1::SectionsController < ApplicationController
  load_and_authorize_resource :article
  load_and_authorize_resource :section, through: :article

  def show; end

  def create
    if @section.save
      render status: :created
    else
      render json: @section.errors, status: :unprocessable_entity
    end
  end

  def update
    if @section.update(section_params)
      head :no_content
    else
      render json: @section.errors, status: :unprocessable_entity
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
