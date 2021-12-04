class MylistController < ApplicationController
    def create
        mylist = current_user.mylist.create(post_question_id: params[:id])
        redirect_to "/posts/questions/list",notice: "保存しました"
    end

    def destroy
        
    end
end
