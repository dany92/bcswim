class QuestionsController < ApplicationController
	def index
		@questions=Question.all
	end

	def new
		@question=Question.new
	end

	def create
		@question = Question.new(question_params)
    	if @question.save
    		flash[:success]="Question created"
     		redirect_to '/questions'
    	else
    		flash.now[:error]="please try again"
     		render '/'
    	end
	end

def edit
   @question = Question.find(params[:id])
end

def update
  @question = Question.find(params[:id])
  if @question.update(question_params)
    redirect_to '/questions'
  else
    render '/'
  end
end

def destroy_multiple

  Question.destroy(params[:questions])

  respond_to do |format|
    format.html { redirect_to '/questions' }
    format.json { head :no_content }
  end

end

	private 
	def question_params
    params.require(:question).permit(:id, :num, :context, :category)
    end

end
