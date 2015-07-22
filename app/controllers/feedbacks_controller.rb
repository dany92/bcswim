class FeedbacksController < ApplicationController
  def index
  	@feedbacks=Feedback.all
  end

  def show
  	@feedback=Feedback.find(params[:id])
  end
end
