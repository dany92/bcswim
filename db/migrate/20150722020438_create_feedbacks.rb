class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :response_id
      t.string :swimmer_id
      t.integer :form_id
      t.text :feedback
      t.timestamp :feedback_date

      t.timestamps null: false
    end
  end
end
