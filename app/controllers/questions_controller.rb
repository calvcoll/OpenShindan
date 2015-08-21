class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    render plain: params[:question].inspect
  end

  def index
    @questions = Question.order('id DESC').limit(10).all
  end
end
