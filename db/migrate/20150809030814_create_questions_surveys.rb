class CreateQuestionsSurveys < ActiveRecord::Migration
  def change
    create_table :questions_surveys, :id => false do |t|
		t.references :survey, :null => false
  		t.references :question, :null => false
  	end
    end
  end
