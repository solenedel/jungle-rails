require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    # check that password and confirmation match
    it 'returns an error if password and password confirmation do not match' do
      @user = User.new(first_name: 'Apple', last_name: 'Pi', email: 'applepi@mail.com', password: 'badpassword', password_confirmation: 'worsepassword')
      @user.save
      expect(@user.errors.full_messages).to include("Passwords don't match")
    end

    # first name must be provided
    it 'returns an error if first name is not provided' do
      @user = User.new(last_name: 'Pi', email: 'applepi@mail.com', password: 'badpassword', password_confirmation: 'badpassword')
      @user.save
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    # last name must be provided
    it 'returns an error if last name is not provided' do
      @user = User.new(first_name: 'Apple', email: 'applepi@mail.com', password: 'badpassword', password_confirmation: 'badpassword')
      @user.save
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    # email must be provided
    it 'returns an error if email is not provided' do
      @user = User.new(first_name: 'Apple', last_name: 'Pi', password: 'badpassword', password_confirmation: 'badpassword')
      @user.save
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    # should save successfully
    it 'saves successfully when all fields are present and valid' do
      @user = User.new(first_name: 'Apple', last_name: 'Pi', email: 'applepi@mail.com', password: 'badpassword', password_confirmation: 'badpassword')
      @user.save!
    end

    # prevent duplicate emails from being saved in database
    it 'returns an error if email already exixts in database' do
      @user1 = User.new(first_name: 'Apple', last_name: 'Pi', email: 'applepi@mail.com', password: 'badpassword', password_confirmation: 'badpassword')
      @user1 = User.new(first_name: 'Banana', last_name: 'Bread', email: 'applepi@mail.com', password: 'goodpassword', password_confirmation: 'goodpassword')
      @user1.save
      @user2.save
      expect(@user2.errors.full_messages).to include("This email is taken")
    end


    # password too short
    it 'returns an error if password is less than 8 characters' do
      @user = User.new(first_name: 'Apple', last_name: 'Pi', email: 'applepi@mail.com', password: 'hello', password_confirmation: 'hello')
      @user.save
      expect(@user.errors.full_messages).to include("Password must be at least 8 characters")
    end

     # save successfully if password is long enough
     it 'saves successfully if password is at least 8 characters' do
      @user = User.new(first_name: 'Apple', last_name: 'Pi', email: 'applepi@mail.com', password: 'goodpassword', password_confirmation: 'goodpassword')
      @user.save!
    end
    
  end
end
