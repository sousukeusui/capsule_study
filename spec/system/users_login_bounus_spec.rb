require 'rails_helper'

describe "ログイン機能" do
    let(:user_a){FactoryBot.create(:user,name:'ユーザーA',mail:'a@example.com')} 
    let(:user_b){FactoryBot.create(:user,name:'ユーザーB',mail:'b@example.com',logged_in:'2021-04-29 16:03:36.949067',count:1)}
    let(:user_c){FactoryBot.create(:user,name:'ユーザーC',mail:'c@example.com',logged_in:'2021-12-31 16:03:36.949067',count:1)}

    before do
        visit login_path
        fill_in 'メールアドレス',with:login_user.mail
        fill_in 'パスワード', with:login_user.password
        click_button 'ログイン'
    end

    context "ユーザーAがログインした時" do
        let(:login_user){ user_a }

        it "ログインボーナス受け取れる" do
            expect(page).to have_selector '.flash-message',text:':ログインボーナス獲得!'
            click_on 'hoge'
            expect(page).to have_content '600P'  
        end
    end

    context "ユーザーBがログインした時" do
        let(:login_user){ user_b }

        it "ログインボーナス受け取れない" do
            click_on 'hoge'
            expect(page).to have_content '500P'  
        end
    end

    context "ユーザーCがログイン" do
        let(:login_user){ user_c }
        around do |e|
            travel_to('2022-1-10 10:00'.to_time){ e.run }
        end
        it"現在時刻を１月１0日に設定してログイン" do
            expect(Time.zone.now).to eq(Time.new(2022, 1, 10, 10, 0, 0))
            expect(page).to have_selector '.flash-message',text:':ログインボーナス獲得!'
            click_on 'hoge'
            expect(page).to have_content '600P'
        end
    end
end

