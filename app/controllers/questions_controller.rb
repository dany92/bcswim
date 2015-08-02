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
    		flash[:success]="Profile created"
     		redirect_to '/questions'
    	else
    		flash.now[:error]="please try again"
     		render '/'
    	end
	end

=begin
def destroy
    @question = current_user.question.find(params[:num])
    #@question = user.question.find(params[:num])
    @question.destroy

    respond_to do |format|
     format.html { redirect_to '/questions' }
     format.json { head :no_content }
    end
  end    


def destroy_multiple
	#@questions = Question.find(params[:num])
	@questions = Question.find(params[:questions])
	@questions.each do |question|
		question.destroy
	end
end
=end

def destroy_multiple

  Question.destroy(params[:questions])

  respond_to do |format|
    format.html { redirect_to '/questions' }
    format.json { head :no_content }
  end

end

	private 
	def question_params
      params.require(:question).permit(:num, :context, :category)
    end

end
