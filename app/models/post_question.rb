class PostQuestion < ApplicationRecord
    belongs_to :user
    has_many :user_questions

    accepts_nested_attributes_for :user_questions
end
