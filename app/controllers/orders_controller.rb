class OrdersController < ApplicationController
  def index
    @orders = Order.all
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
      flash[:alert] = "Error"
      redirect_to new_order_path
    end    
  end

  def destroy
    @order = Order.find params[:id]
    @order.destroy
    redirect_to orders_path
  end  

  def show
    @order = Order.find params[:id]
  end  
end
