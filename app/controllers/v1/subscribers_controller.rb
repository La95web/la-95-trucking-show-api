class V1::SubscribersController < ApplicationController
  def index
    @subscribers = Subscriber.all
    render json: @subscribers, status: :ok
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)

    if @subscriber.save
      render json: @subscriber, status: :created
    else
      render json: { error: @subscriber.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  def destroy
    @subscriber = Subscriber.find(params[:id])
    authorize! :destroy, @subscriber
    @subscriber.destroy
    head :no_content
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:email)
  end
end
