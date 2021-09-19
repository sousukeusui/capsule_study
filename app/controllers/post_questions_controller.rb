class PostQuestionsController < ApplicationController
    def new
        @post_question = PostQuestion.new
        @post_question.user_questions.build
    end

    def create
        @post_question = current_user.post_questions.new post_question_params
        if @post_question.save
            redirect_to '/posts',notice:'保存しました'
        end

    end

    private
    def post_question_params
        params.require(:post_question).permit(:name,:explanation, user_questions_attributes:[:problem,:answer,:mistake1,:mistake2,:mistake3,])
    end
end
