class V1::DoctipsController < ApplicationController
  load_and_authorize_resource

  def index; end

  def show; end

  def create
    if @doctip.save
      render :show, status: :created
    else
      render json: { error: @doctip.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  def update
    if @doctip.update(doctip_params)
      head :no_content
    else
      render json: { error: @doctip.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  def destroy
    @doctip.destroy
  end

  private

  def doctip_params
    params.require(:doctip).permit(:title, :content, :type, :uploaded_at, :main_image, :thumbnail)
  end
end
