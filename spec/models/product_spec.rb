require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    # when all fields are present, product saves successfully
    it 'saves successfully when all required fields are provided' do
      @category = Category.new(name: 'test category')
      @product = @category.products.new(name: 'test product', price: 40, quantity: 3)
      @product.save!
    end

     # when name not provided
     it 'returns an error when the name field is not provided' do
      @category = Category.new(name: 'test category')
      @product = @category.products.new( price: 40, quantity: 3)
      @product.save
      puts @product.errors.full_messages
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end


    


  end

end
