class ProductsController < ApplicationController
  require 'open-uri'

  def index
  	products_json = open('http://lcboapi.com/products').read
  	@products = JSON.parse(products_json)
  end

  def show
  	products_json = open('http://lcboapi.com/products').read
  	@products = JSON.parse(products_json)
  end

  def format_price(price_in_cents)
  	price = price_in_cents.to_f/100
  end

  helper_method :format_price
end

