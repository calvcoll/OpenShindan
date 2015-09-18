module ShindansHelper
  def fields_for_answer(answer, &block)
    prefix = answer.new_record? ? 'new' : 'existing'
    fields_for "shindan[#{prefix}_task_attributes][]", task, &block
  end

  def add_answer_link(name)
    link_to name do |page|
      page.insert_html :bottom, :answers, :partial => 'answer', :object => Answer.new
    end
  end
end
