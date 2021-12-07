class PostQuestion < ApplicationRecord
    belongs_to :user
    has_many :user_questions, dependent: :destroy
    has_many :mylists

    accepts_nested_attributes_for :user_questions, allow_destroy: true
end
