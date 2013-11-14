class StoresController < ApplicationController
  require 'open-uri'

  def index
  	stores_json = open('http://lcboapi.com/stores').read
  	@stores =JSON.parse(stores_json)
  end

  def show
  	stores_json = open('http://lcboapi.com/stores').read
  	@stores =JSON.parse(stores_json)
  end
end
