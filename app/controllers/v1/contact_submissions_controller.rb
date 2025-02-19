class V1::ContactSubmissionsController < ApplicationController
  def index
    @contact_submissions = ContactSubmission.all
    render json: @contact_submissions, status: :ok
  end

  def create
    @contact_submission = ContactSubmission.new(contact_submission_params)

    if @contact_submission.save
      render json: @contact_submission, status: :created
    else
      render json: { error: @contact_submission.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  def destroy
    @contact_submission = ContactSubmission.find(params[:id])
    authorize! :destroy, @contact_submission
    @contact_submission.destroy
    head :no_content
  end

  private

  def contact_submission_params
    params.require(:contact_submission).permit(:email, :name, :message)
  end
end
