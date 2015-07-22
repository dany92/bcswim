class FeedbacksController < ApplicationController
  def index
  	render "This is BC Swim team"
  	@feedbacks=Feedback.all
  end

  def show
  	@feedback=Feedback.find(params[:id])
  end
end
