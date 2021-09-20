require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    # when all fields are present, product saves successfully
    it 'saves successfully when all required fields are provided' do
      @category = Category.new(name: 'test')
      @product = @category.products.new(name: 'test product', price: 40, quantity: 3)
      @product.save!
    end

  end

end
