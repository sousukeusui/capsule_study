class Question < ApplicationRecord
    validates :subject ,presence: true
    validates :problem ,presence: true
end
