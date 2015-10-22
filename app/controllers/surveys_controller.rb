class SurveysController < ApplicationController
  def index
  	@surveys=Survey.all
  end

  def new
  	@survey=Survey.new
    #@survey.questions.new
    @questions=Question.all
  end

  def create
  	@survey=Survey.new(survey_params)
    @questionson=params[:question][:question_id]
    for q in @questionson
      @survey.question_surveys.build(:question_id => q, :survey_id => @survey.id) 
    end
    #@survey.question_surveys.build(:question_id => (params[:question][:question_id]), :survey_id => @survey.id) 
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
    @survey_questions=QuestionSurvey.where(:survey => @survey)
    @surveyquestions=[]
    @survey_questions.each do |sq|
      @surveyquestions << sq.question_id
    end
    @questions=Question.all
  end

  def respond
    @response=Response.new
    @survey=Survey.find(params[:id])
    @survey_questions=QuestionSurvey.where(:survey => @survey)
    @surveyquestions=[]
    @response=params[:response]
    @survey_questions.each do |sq|
      @surveyquestions << sq.question_id
    end
    @questions=Question.all
    
  end


def submitReponse
    @responses=params[:response][:responses]
    @questions=params[:response][:question_id]
    @survey=Survey.find(params[:id])   
    for i in 0...@responses.size
      @response=Response.new
      @response.question_id=@questions[i]
      @response.survey_id=@survey.id
      @response.content=@responses[i]
      @response.save
    end
    if @response.save
      flash[:success]="Responses Created"
      redirect_to '/surveys'
    else
      flash.now[:error]="Please try again"
      render'/'
    end
end

  def destroy_multiple

  Survey.destroy(params[:surveys])

  respond_to do |format|
    format.html { redirect_to '/surveys' }
    format.json { head :no_content }
  end
  end

  def survey_params
  	params.require(:survey).permit(:id, :title, :date, :category, :question_id, questions_attributes: [:id, :context], question_surveys_attributes: [:survey_id, :question_id])
  end

  def response_params
    params.require(:survey).permit(:id, :title, :date, :category, :response [], :question_id, questions_attributes: [:id, :context], question_surveys_attributes: [:survey_id, :question_id], responses_attributes: [:survey_id, :question_id, :content])
  end
end
