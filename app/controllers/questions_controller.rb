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
    @user = current_user
    unless @user.admin
      if @user.point < 100
        redirect_to '/questions/new', notice: 'ポイントが足りません'
      elsif @user.point >= 100
        used_point = @user.point - 100
        @user.update(point: used_point)
      end
    end

      answers = []
      @answers = []
      @id = []
      num = 0

      # データベースからランダムにデータをとりだす
      @questions = Question.order("RANDOM()").limit(10)                   
      # 取り出したデータのanswerカラムのデータを一つずつanswers配列に格納,misatakeカラムのデータをdummys配列に格納
      @questions.each do |question|
          answers << question.answer
          answers << question.mistake1
          answers << question.mistake2
          answers << question.mistake3
          @id << question.id 
      end 

      #answersに格納したデータを１つの問題ごとに分割し、選択肢作成
      answers = answers.each_slice(4).to_a

      #選択肢をシャッフル
      while num<10 do
        @answers[num] = answers[num].shuffle
        num +=1
      end
  end


  def result
    user = current_user
    point = user.point
    result = []
    @questions = []
    @answers = []
    (0..9).each do |number|
      question = Question.find(params["question#{number}"])
      @questions << question.problem
      @answers << question.answer
      if  params["selfanswer#{number}"] == question.answer
        result[number] = "正解"
      else
        result[number] = "不正解"
      end
    end

    @number_questions = @questions.size 
    @correct = result.count("正解")
    answer_rate = @correct.to_f / @number_questions.to_f

    if answer_rate < 0.2
      @msg = '頑張ろう'
      user.update(point:point + 10)
      @point = 10
    elsif answer_rate >=0.2 && answer_rate < 0.4
      @msg = 'うんうん'
      user.update(point:point + 20)
      @point = 20
    elsif answer_rate >= 0.4 && answer_rate < 0.6
      @msg = 'あと半分！'
      user.update(point:point + 50)
      @point = 50
    elsif answer_rate >= 0.6 && answer_rate <0.8
      @msg = 'もうちょっと！'
      user.update(point:point + 70)
      @point = 70
    elsif answer_rate >=0.8 && answer_rate < 1
      @msg = 'あと一歩'
      user.update(point:point + 150)
      @point = 150
    elsif answer_rate == 1
      @msg = '満点おめでとう！！'
      user.update(point:point + 200 )
      @point = 200
    end
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
    params.require(:question).permit(:subject,:problem,:answer,:mistake1,:mistake2,:mistake3)
  end

  def session_params
    params.require(:session).permit(:answer)
  end

  
end
