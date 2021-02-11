class QuestionsController < ApplicationController
before_action :require_admin, only:[:create]

  def index
    @questions = Question.all
    @question = Question.new
  end

  def new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update question_params
      redirect_to '/questions/index', notice:'更新しました'
    else
      render 'edit'
    end
  end

  def delete
    @question =Question.find(params[:id])
    @question.destroy
    redirect_to '/questions/index' ,notice: '問題を削除しました'
  end

  def answer
  end

  def result
  end

  def create 
    @question = Question.new question_params
    if @question.save
      redirect_to '/questions/index', notice:'保存しました'
    else
      @questions = Question.all
      render 'index'
    end
  end

  private
  def question_params
    params.require(:question).permit(:subject,:problem)
  end

  
end
