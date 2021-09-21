require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    # check that password and confirmation match
    it 'returns an error if password and password confirmation do not match'
      @user = User.new(first_name: 'Apple', last_name: 'Pi', email: 'applepi@mail.com', password: 'badpassword', password_confirmation: 'worsepassword')
      @user.save
      expect(@user.errors.full_messages).to include("Passwords don't match")
    end

    # first name must be provided
    it 'returns an error if first name is not provided'
      @user = User.new(last_name: 'Pi', email: 'applepi@mail.com', password: 'badpassword', password_confirmation: 'badpassword')
      @user.save
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    # last name must be provided
    it 'returns an error if last name is not provided'
      @user = User.new(first_name: 'Apple', email: 'applepi@mail.com', password: 'badpassword', password_confirmation: 'badpassword')
      @user.save
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

     # email must be provided
     it 'returns an error if email is not provided'
     @user = User.new(first_name: 'Apple', last_name: 'Pi', password: 'badpassword', password_confirmation: 'badpassword')
     @user.save
     expect(@user.errors.full_messages).to include("Email can't be blank")
   end


  end

end
