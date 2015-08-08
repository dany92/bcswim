class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :title
      t.date :string
      t.timestamps null: false
      #change_column(:survey, :date, :string)
    end
  end
end
