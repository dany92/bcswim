class SurveysController < ApplicationController
  def index
  	@surveys=Survey.all
  end

  def new
  	@survey=Survey.new
  end

  def create
  	@survey=Survey.new(survey_params)
    @questions= Question.where(:id => params[:questions_on_survey])
    @survey.questions << @questions
  	if @survey.save
  		flash[:success]="Survey Created"
  		redirect_to '/surveys'
  	else
  		flash.now[:error]="Please try again"
  		render'/'
  	end
  end

  def show
    @survey = Survey.find(params[:id])
    @questions=Question.all
  end


  def destroy_multiple

  Survey.destroy(params[:surveys])

  respond_to do |format|
    format.html { redirect_to '/surveys' }
    format.json { head :no_content }
  end
  end

  def survey_params
  	params.require(:survey).permit(:title, :date, questions_attributes: [:id,:_destroy, :category, :context])
  end
end
