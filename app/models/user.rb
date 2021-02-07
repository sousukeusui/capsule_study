class User < ApplicationRecord
    has_secure_password(validations: false)
    has_many :posts
    mount_uploader :image, ImageUploader

    validates :name, presence: true, length: {maximum: 10}, on: :update

    with_options on: :step1 do
        validates :name, presence: true, length: {maximum: 10}
        validates :mail, presence: true, uniqueness: true
        validates :password_digest, presence: true,length: {minimum: 4,maximum: 12},on: :create
    end

    with_options on: :step2 do
        validate :validate_name_mail_check
        validate :validate_name_password_check
    end

private
    def validate_name_mail_check
        errors.add(:mail, 'が間違っています') unless mail&.present?
    end

    def validate_name_password_check
        errors.add(:password_digest,'が間違っています') unless password_digest&.present?
    end
end
