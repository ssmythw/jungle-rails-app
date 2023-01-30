require 'bcrypt'

class User < ApplicationRecord
  has_secure_password

  def authenticate_with_credentials(email, password)
    
      #strip email of whitespace

      email = email.strip
      email = email.downcase

      #convert email to lowercase

      user = User.where(email: email)[0]
      if user
        if BCrypt::Password.new(user.password_digest) == password
          return user
        else
          return nil
        end
      else
        return nil
      end

      return user
  end

  validates :name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true, length: { minimum: 6}
end
