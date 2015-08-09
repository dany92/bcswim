class CreateQuestionsSurveys < ActiveRecord::Migration
  def change
    create_table :questions_surveys do |t|
		t.integer :survey_id
  		t.integer :question_id
  	end
  	add_index :questions_surveys, [:survey_id, :question_id]
    end
  end
