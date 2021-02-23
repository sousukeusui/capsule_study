class QuestionsController < ApplicationController
before_action :require_admin, only:[:create]

  def index
    @questions = Question.all
    @question = Question.new
  end

  def new
    @questions = Question.new
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
    answers1 = []
    answers2 = []
    answers3 = []
    answers4 = []
    answers5 = []
    @answers = []
    answers = []
    dummys = []
    dummy = '不正解'
    n=0
    t=0
    l=1
    # データベースからランダムにデータをとりだす
    @questions = Question.order("RANDOM()").limit(5)
    # 取り出したデータのanswerカラムのデータを一つずつanswers配列に格納
    @questions.each do |question|
        answers << question.answer
    end 
    # answers配列に格納したデータを分ける
    answers1 << answers[0]
    answers2 << answers[1]
    answers3 << answers[2]
    answers4 << answers[3]
    answers5 << answers[4]
 
    # 不正解の配列を作る
    15.times do 
      dummys << dummy
    end

    @answers = [answers1,answers2,answers3,answers4,answers5]

    dummys.each.with_index(1) do |dum,i|
      @answers[n][1+t] = dum
      t +=1
      if i == 3*l
        n+=1
        l+=1
        t=0
      end
    end
    p @answers
    
    


  end

  def answer_check
    
  end

  def answer_random
    n = 0
    result = nil 

    while n<5
      n = n+1
      reslut = (1..4).to_a.sample(1)
      if result == 1 && n ==1 
        @answer1 = Question.answer

      elsif result ==1 && n ==2
        @answer2 = Question.answer

      elsif result ==1 && n ==3
        @answer3 = Question.answer

      elsif result == 1 && n ==4
        @answer4 = Question.answer

      end
    end
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
    params.require(:question).permit(:subject,:problem,:answer)
  end

  
end
