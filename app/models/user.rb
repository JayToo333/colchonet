class User < ApplicationRecord
  EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

  has_secure_password

  validates :full_name, :email, :location, presence: true
  validates :bio, length: { minimum: 30 }, allow_blank: false
  validates :email, format: { with: EMAIL_REGEXP }, uniqueness: true

  before_create do |user|
    user.confirmation_token = SecureRandom.urlsafe_base64
  end

  def confirm!
    return if confirmed?

    self.confirmed_at = Time.current
    self.confirmation_token = ""
    save!
  end

  def confirmed?
    confirmed_at.present?
  end
end
