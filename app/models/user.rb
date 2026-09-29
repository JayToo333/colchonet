class User < ApplicationRecord
  EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

  has_secure_password

  validates :full_name, :email, :location, presence: true
  validates :bio, length: { minimum: 30 }, allow_blank: false
  validates :email, format: { with: EMAIL_REGEXP }, uniqueness: true
end
