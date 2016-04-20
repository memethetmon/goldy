class RpgController < ApplicationController
  def index
  	if !session[:gold]
  		session[:gold] = 0
  		session[:log] = []
  	end
  	@gold = session[:gold]
  	@logs = session[:log]
  end

  def farm
  	@gain = rand(10..20).to_i
  	@time = Time.now.strftime("%Y/%m/%d %H:%M %p")
  	session[:gold] += @gain
  	session[:log] << "Earned #{@gain} golds from the farm! (#{@time})"

  	redirect_to '/'
  end

  def cave
  	@gain = rand(5..10).to_i
  	@time = Time.now.strftime("%Y/%m/%d %H:%M %p")
  	session[:gold] += @gain
  	session[:log] << "Earned #{@gain} golds from the cave! (#{@time})"

  	redirect_to '/'
  end

  def casino
  	@gain = rand(-50..50).to_i
  	@time = Time.now.strftime("%Y/%m/%d %H:%M %p")
  	session[:gold] += @gain
  	if @gain > 0
  		session[:log] = "Earned #{@gain} golds from the casino! (#{@time})"
  	else
  		session[:log] << "Entered a casino and lost #{@gain} golds...Ouch! (#{@time})"
  	end

  	redirect_to '/'
  end

  def house
  	@gain = rand(2..5).to_i
  	@time = Time.now.strftime("%Y/%m/%d %H:%M %p")
  	session[:gold] += @gain
  	session[:log] << "Earned #{@gain} golds from the house! (#{@time})"

  	redirect_to '/'
  end
end
