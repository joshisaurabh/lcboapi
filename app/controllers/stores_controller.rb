class StoresController < ApplicationController
  require 'open-uri'

  def index
    page = 1
    if params[:page]
      page=params[:page]
    end
  	stores_json = open("http://lcboapi.com/stores/?page=#{page}").read
  	@stores =JSON.parse(stores_json)
  end

  def show
  	stores_json = open('http://lcboapi.com/stores').read
  	@stores =JSON.parse(stores_json)
  end

  def convert_time(minutes)
  	time = minutes.to_f/60
  	if time <12 
  		time.to_s+" am"
  	elsif time==12
  		time.to_s+" noon"
  	else
  		(time-12).to_s+" pm"
  	end
  end

  helper_method :convert_time

end
