class HomeController < ApplicationController


  def index
  end

  #calculate products
  def product_calculate
  	@product =  Product.any_of({:length=> params[:product][:length]},{:width=> params[:product][:width]},{:height=> params[:product][:height]},{:weight=> params[:product][:weight]})
	respond_to do |format| 
		format.js
	end  	
  end

end
