class User < ActiveRecord::Base
  has_secure_password

    validates :first_name, :last_name, :email, :password, :password_confirmation, presence: true

    validates_length_of :password, minimum: 8

    validates_uniqueness_of :email, case-sensitive: false

    
end
