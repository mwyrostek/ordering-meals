class ItemsController < ApplicationController
  respond_to :json

  def new
    @item = Item.new
    render :layout => false
  end
  
  def create
    @item = Item.create params[:item]
    respond_with(@item)
  end

  def show
    @item = Item.find(params[:id])
    respond_with(@item)

    
  end

end
