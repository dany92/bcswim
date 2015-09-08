class Survey < ActiveRecord::Base
	#has_many :questions, :dependent => :destroy
	has_many :questions, through: :question_surveys 
	has_many :question_surveys
	has_many :answers
	accepts_nested_attributes_for :questions, :question_surveys, allow_destroy: true
	#accepts_nested_attributes_for :questions,
end
