class Shindan < ActiveRecord::Base
  validates :title, presence: true
  has_many :answers, :dependent => :destroy

  after_update :save_answers

  def new_answer_attributes=(answer_attributes)
    answer_attributes.each do |attributes|
      answers.build attributes
    end
  end

  def existing_answer_attributes=(answer_attributes)
    answers.reject(&:new_record?).each do |answer|
      attributes = answer_attributes[answer.id.to_s]
      if attributes
        answer.attributes = attributes
      else
        answers.delete(answer)
      end
    end
  end

  def save_answers
    answer.each do |answer|
      answer.save(false)
    end
  end
end
