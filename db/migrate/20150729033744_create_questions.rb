class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :num
      t.string :category
      t.text :context
      t.timestamps null: false
    end
  end
end
