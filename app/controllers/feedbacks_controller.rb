class FeedbacksController < ApplicationController
	before_action :require_admin, only: [:destroy]
	before_action :require_coach, only: [:edit, :destroy]
	before_action :require_user, only: [:index, :show]
  def index
  	@feedbacks=Feedback.all
  end

  def show
  	@feedback=Feedback.find(params[:id])
  end
  def edit
  end
  def destroy
  end

end
