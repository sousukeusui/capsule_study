require 'rails_helper'

describe "問題機能" do
    let(:user_a){FactoryBot.create(:user,name:'ユーザーA',mail:'a@example.com',logged_in:'2021-04-23 17:03:36.949067')}
    #user_bのlogged_inの日付を今日の日付にする
    let(:user_b){FactoryBot.create(:user,name:'ユーザーB',mail:'b@example.com',point:'50',logged_in:'2021-05-02 08:03:36.949067',count:1)}
    
    before do
        10.times do
            FactoryBot.create(:question,answer:"答え")
        end
        visit login_path
        fill_in 'メールアドレス',with: login_user.mail
        fill_in 'パスワード', with:login_user.password
        click_button 'ログイン'
        click_on 'hoge'
        click_link '問題を解く'
        click_on 'ガチャを回す'
    end

    describe "解答結果表示機能" do

        context "ユーザーAがログインする時" do
            let(:login_user){ user_a }

            it '結果表示' do
                click_button '解答終了'
                expect(page).to have_content '解答結果'  
            end
        end
    end

    describe "問題生成時ポイント消費機能" do

        context "ユーザーAがログインする時" do
            let(:login_user){ user_a }

            it '問題が表示される' do
                expect(page).to have_content 'テスト'
                click_on 'hoge'
                expect(page).to have_content '500' 
            end
        end

        context "ユーザーBがログインする時" do
            let(:login_user){ user_b }

            it 'ポイントが足りず問題画面に移動できない' do
                expect(page).to have_selector '.flash-message', text:'ポイントが足りません'  
            end
        end
    end  

    describe "ポイント獲得機能" do
        let(:login_user){ user_a }

        context "正解率20%未満の時" do

            before do
                num = 0
                find("#selfanswer#{num}[value='答え']").click
                click_button '解答終了'
            end

            it "10ポイント増える" do
                expect(page).to have_content'10ポイント獲得！'
                click_on 'hoge'
                expect(page).to have_content '510'  
            end
        end

        context "正解率20%~39%" do

            before do
                num = 0
                3.times do
                    find("#selfanswer#{num}[value='答え']").click
                    num+=1
                end
                click_button '解答終了'
            end

            it "20ポイント増える" do
                expect(page).to have_content'20ポイント獲得！'
                click_on 'hoge'
                expect(page).to have_content '520'
            end
        end

        context "正解率40%~59%" do

            before do
                num = 0
                5.times do
                    find("#selfanswer#{num}[value='答え']").click
                    num+=1
                end
                click_button '解答終了'
            end
            
            it "50ポイント増える" do
                expect(page).to have_content'50ポイント獲得！'
                click_on 'hoge'
                expect(page).to have_content '550'
            end
        end

        context "正解率60%~79%" do

            before do
                num = 0
                7.times do
                    find("#selfanswer#{num}[value='答え']").click
                    num+=1
                end
                click_button '解答終了'
            end

            it "70ポイント増える" do
                expect(page).to have_content'70ポイント獲得！'
                click_on 'hoge'
                expect(page).to have_content '570'
            end
        end

        context "正解率80%~99%" do

            before do
                num = 0
                9.times do
                    find("#selfanswer#{num}[value='答え']").click
                    num+=1
                end

                click_button '解答終了'
            end

            it "150ポイント増える" do
                expect(page).to have_content'150ポイント獲得！'
                click_on 'hoge'
                expect(page).to have_content '650'
            end
        end

        context "正解率100%" do
            before do
                num = 0
                10.times do
                    find("#selfanswer#{num}[value='答え']").click
                    num+=1
                end
                click_button '解答終了'
            end

            it "200ポイント増える" do
                expect(page).to have_content'200ポイント獲得！'
                click_on 'hoge'
                expect(page).to have_content '700'
            end
        end
    end
end