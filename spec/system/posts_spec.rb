require 'rails_helper'

describe '投稿機能', type: :system do
    let(:user_a){FactoryBot.create(:user,name:'ユーザーA',mail:'a@example.com')}
    let(:user_b){FactoryBot.create(:user,name:'ユーザーB',mail:'b@example.com')}
    let!(:post_a){FactoryBot.create(:post,content:'テスト投稿',user: user_a)}
    before do
        visit login_path
        #適当なユーザーでログインする
        fill_in 'メールアドレス', with: login_user.mail
        fill_in 'パスワード', with:login_user.password
        click_button 'ログイン'
        #タイムライン移動
    end

    shared_examples_for 'ユーザーAが投稿した内容が表示される' do
        it { expect(page).to have_content 'テスト投稿' }
    end

    describe "投稿共有表示機能" do
        before do
            visit posts_path
        end

        context "ユーザーAがログインしている時" do
            let(:login_user){ user_a }

            it_behaves_like 'ユーザーAが投稿した内容が表示される'
            
        end

        context "ユーザーBがログインしている時"do
            let(:login_user){ user_b }

            it_behaves_like 'ユーザーAが投稿した内容が表示される'
        end
    end

    describe 'マイページ投稿表示機能' do
        before do
            click_on 'dropdownMenuLink'
            click_link 'マイページ'
        end

        context 'ユーザーAがログインしている時' do
            let(:login_user) { user_a }

            it_behaves_like 'ユーザーAが投稿した内容が表示される'
        end

        context 'ユーザーBがログインしている時' do
            let(:login_user) { user_b }

            it 'ユーザーAが投稿した内容が表示されない' do
                expect(page).to have_no_content 'テスト投稿' 
            end
        end
    end

    describe '投稿編集機能' do 
        context 'ユーザーAがログインしている時' do
            let(:login_user) { user_a }

            before do
                click_link '編集'
                fill_in '内容' ,with:'更新した投稿'
                click_button '更新'
            end
            
            it '更新内容がマイページに表示される' do
                expect(page).to have_content '更新した投稿' 
            end
        end   
    end

    describe '投稿削除機能' do
        context 'ユーザーAがログインしている時' do
            let(:login_user){ user_a}

            before do
                click_link '削除'
                page.accept_confirm "この投稿を削除しますか？"
            end

            it '投稿がマイページに表示されなくなっている' do
                expect(page).to have_no_content 'テスト投稿'
            end

        end
        
    end
end
