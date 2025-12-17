class V1::MultigallerysController < ApplicationController
  load_and_authorize_resource

  def index
    @multigallerys = Multigallery.all
    # Rails renderá index.json.jbuilder automáticamente
  end

  def show
    @multigallery = Multigallery.find(params[:id])
    # Rails renderá show.json.jbuilder automáticamente
  end

  def create
    @multigallery = Multigallery.new(multigallery_params)

    if @multigallery.save
      render :show, status: :created
    else
      render json: @multigallery.errors, status: :unprocessable_entity
    end
  end

  def update
    @multigallery = Multigallery.find(params[:id])

    if @multigallery.update(multigallery_params)
      render :show, status: :ok
    else
      render json: @multigallery.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @multigallery.destroy
    head :no_content
  end

  private

  def multigallery_params
    params.require(:multigallery).permit(:uploaded_at, :poster, video: [], thumbnail: [], gallery: [])
  end
end
