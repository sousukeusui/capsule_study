class PostQuestionsController < ApplicationController
    def new
        @post_question = PostQuestion.new
        @post_question.user_questions.build
    end

    def create
        @post_question = current_user.post_questions.new post_question_params
        if @post_question.save
            redirect_to '/posts/questions/list',notice:'保存しました'
        else
            render 'new'
        end

    end

    def list
        @post_questions = PostQuestion.all
    end

    def start
        @post_questions = PostQuestion.find(params[:id])
        user_questions = UserQuestion.where(post_question_id: params[:id])
        @number_of_questions = user_questions.count
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

        # データベースからパラメーターで渡されたidのデータをとりだす
        @user_questions = UserQuestion.where(post_question_id: params[:id])
        @number_of_questions = @user_questions.count
        # 取り出したデータのanswerカラムのデータを一つずつanswers配列に格納,misatakeカラムのデータをdummys配列に格納
        @user_questions.each do |question|
            answers << question.answer
            answers << question.mistake1
            answers << question.mistake2
            answers << question.mistake3
            @id << question.id
        end 

        #answersに格納したデータを１つの問題ごとに分割し、選択肢作成
        answers = answers.each_slice(4).to_a

        #選択肢をシャッフル
        while num<@number_of_questions do
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
        user_questions = UserQuestion.where(post_question_id: params[:id])
        @number_questions = user_questions.count
        max_questions = @number_questions - 1

        (0..max_questions).each do |question_num|
            question = UserQuestion.find(params["question#{question_num}"])
            @questions << question.problem
            @answers << question.answer
            if  params["selfanswer#{question_num}"] == question.answer
                result[question_num] = "正解"
            else
                result[question_num] = "不正解"
            end
        end

        @correct = result.count("正解")
        answer_rate = @correct.to_f / @number_questions.to_f

        if answer_rate < 0.2
            @msg = '頑張ろう'
            user.update(point:point + 10)
            @point = 10
        elsif answer_rate >=0.2 && answer_rate < 0.4
            @msg = 'うんうん'
            user.update(point:ƒpoint + 20)
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

    private
    def post_question_params
        params.require(:post_question).permit(:name,:explanation, user_questions_attributes:[:problem,:answer,:mistake1,:mistake2,:mistake3,])
    end
end
