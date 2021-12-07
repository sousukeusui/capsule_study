class MylistController < ApplicationController
    def create
        mylist = current_user.mylists.create(post_question_id: params[:id])
        redirect_to "/posts/questions/list",notice: "登録しました"
    end

    def destroy
        mylist = current_user.mylists.find_by(post_question_id: params[:id]).destroy
        redirect_to "/posts/questions/list",notice: "登録を解除しました"
    end
end
