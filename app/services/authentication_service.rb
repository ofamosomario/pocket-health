# frozen_string_literal: true

class AuthenticationService
  class << self
    include AuthConstants

    def reset_attempts(user)
      if user.failed_attempts == MAX_ATTEMPS
        user.update_attribute(:failed_attempts, ZERO_ATTEMPTS)
      end
    end

    def login_failed_attempt(user)
      return unless user.present? && user.failed_attempts <= MAX_ATTEMPS
      User.increment_failed_attempts(user)
      if user.failed_attempts == MAX_ATTEMPS
        user.update_attribute(:locked_at, DateTime.now)
      end
    end

    def verify_block_account(user)
      if user.present? && user.failed_attempts >= MAX_ATTEMPS
        true
      else
        false
      end
    end
  end
end
