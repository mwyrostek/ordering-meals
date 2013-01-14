#encoding: utf-8

class OrdersController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  def index 
    @orders = Order.with_date params[:date]
    render :layout => false if params[:date]
  end

  def new
    @order = Order.new
    # @users_array = User.all.map{|u| [u.email, u.id]}
    # przekazanie do zmiennej tablicy email + id    
    @restaurants_array = Restaurant.all.map{|r| [r.name, r.id]}
    @items_array = Item.all.map{|i| [i.name, i.id]}    
  end  

  def create
    #raise params.inspect
    @order = Order.new params[:order]
    @order.user = current_user
    if @order.save
      flash[:notice] = "Zapisano poprawnie"
      redirect_to orders_path
    else
      flash[:alert] = @order.errors.messages
      redirect_to new_order_path
    end    
  end

  def destroy
    @order = Order.find params[:id]
    if @order.user == current_user
      @order.destroy
      flash[:notice] = "Usunięto poprawnie"
    else
      flash[:alert] = "nie mozesz usunąć nie swojego zamówienia"
    end      
    redirect_to orders_path
  end  

  def show
    @order = Order.find params[:id]
  end  
end
