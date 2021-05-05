require 'rails_helper'

describe '投稿管理機能', type: :system do
            let(:user_a){FactoryBot.create(:user,name: 'ユーザーA',mail: 'a@example.com')}
            let(:user_b){FactoryBot.create(:user,name:'ユーザーB',mail:'b@example.com')}
            let!(:post_a){FactoryBot.create(:post,content:'最初の投稿',user:user_a)}

        before do
            FactoryBot.create(:post, content:'最初の投稿',user: user_a)
            visit login_path
            fill_in 'メールアドレス',	with: login_user.mail
            fill_in 'パスワード', with:login_user.password
            click_button 'ログイン'
        end

        shared_examples_for 'ユーザーAが作成した投稿が表示される'do
            it { expect(page).to have_content '最初の投稿' }
        end

    describe 'マイページ投稿表示機能' do
        context 'ユーザーAがログインしている時' do
            let(:login_user){user_a}

            it_behaves_like 'ユーザーAが作成した投稿が表示される'
        end

        context 'ユーザーBがログインしている時' do
            let(:login_user){user_b}

            it 'ユーザーAの投稿がユーザーBのマイページに表示されない' do
                expect(page).to have_no_content '最初の投稿'  
            end
        end 
    end
end