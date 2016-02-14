class AddQuestionToResponses < ActiveRecord::Migration
  def change
  	add_column :responses, :question, :text
  end
end
