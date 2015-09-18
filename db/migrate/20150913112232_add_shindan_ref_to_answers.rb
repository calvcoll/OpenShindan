class AddShindanRefToAnswers < ActiveRecord::Migration
  def change
    add_reference :answers, :shindan, index: true, foreign_key: true
  end
end
