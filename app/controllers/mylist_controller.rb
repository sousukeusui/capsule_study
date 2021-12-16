class MylistController < ApplicationController
    def create
        @post_question = PostQuestion.find(params[:id])
        current_user.mylists.create(post_question_id: @post_question.id)
    end

    def destroy
        @post_question = PostQuestion.find(params[:id])
        current_user.mylists.find_by(post_question_id: @post_question.id).destroy
    end

    def delete
        @mylist = Mylist.find(params[:id])
        @mylist.destroy
        redirect_to "/users/show/#{current_user.id}",notice: '削除しました'
    end
end
