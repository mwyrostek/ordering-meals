class RestaurantsController < ApplicationController
  respond_to :json

  def show
    @items = Restaurant.find(params[:id]).items
    respond_with(@items)
    
  end

end
