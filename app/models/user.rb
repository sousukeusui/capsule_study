class User < ApplicationRecord
    has_secure_password(validations: false)
    has_many :posts
    has_many :post_questions
    has_many :mylists
    mount_uploader :image, ImageUploader

    validates :name, presence: true, length: {maximum: 10}
    validates :mail, presence: true, uniqueness: true, on: :create
    validates :password_digest, presence: true,length: {minimum: 4},on: :create 
    validates :profile,length:{maximum:100}

    def mylist_by?(post_question_id)
        mylists.where(post_question_id: post_question_id).exists?
    end

#     with_options on: :step2 do
#         validate :validate_name_mail_check
#         validate :validate_name_password_check
#     end

# private
#     def validate_name_mail_check
#         errors.add(:mail, 'が間違っています') unless mail&.autheicate
#     end

#     def validate_name_password_check
#         errors.add(:password_digest,'が間違っています') unless password_digest&.present?
#     end
end
