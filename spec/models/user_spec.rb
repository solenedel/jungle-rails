require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    # check that password and confirmation match
    it 'returns an error if password and password confirmation do not match'
      @user = User.new(first_name: 'Apple', last_name: 'Pi', email: 'applepi@mail.com', password: 'badpassword', password_confirmation: 'worsepassword')
      @user.save
      expect(@user.errors.full_messages).to include("Passwords don't match")
    end
  end

  #

end
