# frozen_string_literal: true

class User < ApplicationRecord
  # ATTRS
  attr_accessor :password

  # MODEL VALIDATES
  validates :email, length: { minimum: 5, maximum: 70 }, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, length: { minimum: 5, maximum: 70 }, uniqueness: true
  validates :password, length: { minimum: 6, maximum: 70 }
  validates_confirmation_of :password

  # CALLBACKS
  before_create :encrypt_password

  # CUSTOM METHOD
  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end

  class << self
    def increment_failed_attempts(user)
      user.increment!(:failed_attempts)
    end

    def authenticate(email, password)
      user = User.find_by_email(email)
      if (user.present?) && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
        [user, true]
      else
        [user, false]
      end
    end
  end
end
