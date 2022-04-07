module Cenit
  class AuthToken < BasicToken

    token_length Cenit.default_auth_token_length

    before_save :authorize

    def authorize
      errors.add(:base, 'You are not authorized to create/update Auth Tokens') unless ::User.super_access?
      throw :abort if errors.present?
    end
  end
end