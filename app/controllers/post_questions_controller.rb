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
        @post_question = PostQuestion.all
    end

    def start
        @post_question = PostQuestion.find(params[:id])
        user_question = UserQuestion.where(post_question_id: params[:id])
        @number_of_question = user_question.count
    end

    private
    def post_question_params
        params.require(:post_question).permit(:name,:explanation, user_questions_attributes:[:problem,:answer,:mistake1,:mistake2,:mistake3,])
    end
end
