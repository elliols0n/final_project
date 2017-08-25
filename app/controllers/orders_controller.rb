class OrdersController < ApplicationController
  def index
    @orders = Order.all

    render("orders/index.html.erb")
  end

  def show
    @order = Order.find(params[:id])

    render("orders/show.html.erb")
  end

  def new
    @order = Order.new

    render("orders/new.html.erb")
  end

  def create
    @order = Order.new

    @order.user_id = params[:user_id]
    @order.dish_id = params[:dish_id]
    @order.user_comment = params[:user_comment]
    @order.group_order_id = params[:group_order_id]
    @order.restaurant_id = params[:restaurant_id]
    @order.menu_id = params[:menu_id]
    # @order.group_order.menu_id = GroupOrder.find_by({ :menu_id => group_order.menu_id })

    save_status = @order.save

    if save_status == true
      redirect_to("/group_orders/#{@order.group_order_id}", :notice => "Order created successfully.")
    else
      render("orders/new.html.erb")
    end
  end

  def edit
    @order = Order.find(params[:id])

    render("orders/edit.html.erb")
  end

  def update
    @order = Order.find(params[:id])

    @order.user_id = params[:user_id]
    @order.dish_id = params[:dish_id]
    @order.user_comment = params[:user_comment]
    @order.group_order_id = params[:group_order_id]
    @order.restaurant_id = params[:restaurant_id]

    save_status = @order.save

    if save_status == true
      redirect_to("/orders/#{@order.id}", :notice => "Order updated successfully.")
    else
      render("orders/edit.html.erb")
    end
  end

  def destroy
    @order = Order.find(params[:id])

    @order.destroy

    if URI(request.referer).path == "/orders/#{@order.id}"
      redirect_to("/", :notice => "Order deleted.")
    else
      redirect_to(:back, :notice => "Order deleted.")
    end
  end
end
