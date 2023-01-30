require 'rails_helper'

RSpec.describe "Product", type: :model do
    describe 'database validations' do
      it "should save successfully if all product parameters are passed" do
        @category = Category.new(name: 'ferne')
        @product = Product.new(name: 'Fern Custom', price_cents: 19.99, quantity: 100, category: @category)
        @product.save
        expect(@product).to be_valid
      end

      it "should return not valid if the name is nil" do
        @category = Category.new(name: 'ferne')
        @product = Product.new(name: nil, price_cents: 1999, quantity: 100, category: @category)
        @product.save
        expect(@product).not_to be_valid
      end

      it "should return not valid if the price is nil" do
        @category = Category.new(name: 'ferne')
        @product = Product.new(name: 'ferne custom', price_cents: nil, quantity: 100, category: @category)
        @product.save
        expect(@product).not_to be_valid
      end

      it "should return not valid if the quantity is nil" do
        @category = Category.new(name: 'ferne')
        @product = Product.new(name: 'ferne custom', price_cents: 1999, quantity: nil, category: @category)
        @product.save
        expect(@product).not_to be_valid
      end

      it "should return not valid if the category is nil" do
        @category = Category.new(name: 'ferne')
        @product = Product.new(name: 'ferne custom', price_cents: 1999, quantity: 100, category: nil)
        @product.save
        expect(@product).not_to be_valid
      end
    end
  end