class ProductsController < ApplicationController
  require 'open-uri'

  def index
    page = 1
    if params[:page]
      page=params[:page]
    end

  	products_json = open("http://lcboapi.com/products/?page=#{page}").read
  	@products = JSON.parse(products_json)

  end

  def show
  	products_json = open("http://lcboapi.com/products/#{params[:id]}").read
  	# product_json = open("http://lcboapi.com/products/#{params[:id]}").read
  	@products = JSON.parse(products_json)
  	# @product = product_json('result')
  end

 # def get_data(page_num)
 # 	products_json = open("http://lcboapi.com/products/?=page#{page_num}").read
 #  	@products = JSON.parse(products_json)
 # end

  def format_price(price_in_cents)
  	price = price_in_cents.to_f/100
  end

  helper_method :format_price
end

