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
        
    end

    private
    def post_question_params
        params.require(:post_question).permit(:name,:explanation, user_questions_attributes:[:problem,:answer,:mistake1,:mistake2,:mistake3,])
    end
end
