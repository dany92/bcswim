class SurveysController < ApplicationController
  def index
  	@surveys=Survey.all
  end

  def new
  	@survey=Survey.new
  end

  def surveys_params
    params.require(:survey).permit(:title, questions_attributes: [:_destroy, :id, :category, :context])
  end
end
