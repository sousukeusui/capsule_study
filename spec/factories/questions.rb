FactoryBot.define do
    factory :question do
        subject{1}
        problem{'テスト'}
        answer{'答え'}
        mistake1{'不正解1'}
        mistake2{'不正解2'}
        mistake3{'不正解3'}
    end

end