class V1::AudiosController < ApplicationController
  load_and_authorize_resource
  def index; end
  def show; end

  def create
    if @audio.save
      render :show, status: :created
    else
      render json: { error: @audio.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  def update
    if @audio.update(audio_params)
      head :no_content
    else
      render json: { errors: @audio.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  def destroy
    @audio.destroy
    head :no_content
  end

  private

  def audio_params
    params.require(:audio).permit(:title, :uploaded_at, :main_audio)
  end
end
