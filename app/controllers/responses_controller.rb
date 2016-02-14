class ResponsesController < ApplicationController

	def index
		@user = current_user
		@surveys = []
		if @user.role != 'admin'
			@responses = Response.where(:user_id => @user.id)
		else
			@responses = Response.all
		end
		@responses.each do |r|
				@surveys << Survey.find_by(:id => r.survey_id)
		end
		@surveys = @surveys.uniq
	end

	def edit
		@survey = Survey.find_by(id: params[:id])
		@responses = Response.where(survey_id: params[:id], user_id: current_user.id)
	end

	def show
    	@survey = Survey.find_by(id: params[:id])
    	if current_user.role != 'admin'
    		@responses = Response.where(survey_id: params[:id], user_id: current_user.id)
    	else
    		@responses = Response.where(survey_id: params[:id])
    		#showByUser
    	end
    	@questions = Question.all
  	end

  	def showResponse
  		@survey = Survey.find_by(id: params[:id])
    	if current_user.role != 'admin'
    		@responses = Response.where(survey_id: params[:id], user_id: current_user.id)
    	else
    		@responses = Response.where(survey_id: params[:id])
    		#showByUser
    	end
    	@questions = Question.all

  	end

end
