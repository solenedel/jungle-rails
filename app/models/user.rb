class User < ActiveRecord::Base
  has_secure_password

  # validations
    validates :first_name, :last_name, :email, :password, :password_confirmation, presence: true
    validates_length_of :password, minimum: 8
    validates_uniqueness_of :email, case-sensitive: false

  # user authentication
  def self.authenticate_with_credentials(email, password)
    @user = self.find_by_email(email)

    if @user && @user.authenticate(password)
      return @user
    else
      return nil
    end
    
  end



    
end
