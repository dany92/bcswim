class RemoveFeebackDateFromFeedbacks < ActiveRecord::Migration
  def change
    remove_column :feedbacks, :feedback_date, :timestamp
  end
end
