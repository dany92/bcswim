class CreateQuestionSurveys < ActiveRecord::Migration
  def change
    create_table :question_surveys do |t|
      t.references :survey, :null => false
  	  t.references :question, :null => false	
    end
  end
end
