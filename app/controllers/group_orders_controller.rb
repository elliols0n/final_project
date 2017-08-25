class GroupOrdersController < ApplicationController
  def index
    @group_orders = GroupOrder.all

    render("group_orders/index.html.erb")
  end

  def show
    @group_order = GroupOrder.find(params[:id])
    # @group_order.menu = Menu.find(params[:id])
    

    render("group_orders/show.html.erb")
  end

  def new
    @group_order = GroupOrder.new

    render("group_orders/new.html.erb")
  end

  def create
    @group_order = GroupOrder.new

    @group_order.receipt = params[:receipt]
    @group_order.price = params[:price]
    @group_order.restaurant_id = params[:restaurant_id]
    @group_order.menu_id = params[:menu_id]
    @group_order.name = params[:name]
    @group_order.comment = params[:comment]

    save_status = @group_order.save

    if save_status == true
      redirect_to("/group_orders/#{@group_order.id}", :notice => "Group order created successfully.")
    else
      render("group_orders/new.html.erb")
    end
  end

  def edit
    @group_order = GroupOrder.find(params[:id])

    render("group_orders/edit.html.erb")
  end

  def update
    @group_order = GroupOrder.find(params[:id])

    @group_order.receipt = params[:receipt]
    @group_order.price = params[:price]
    @group_order.restaurant_id = params[:restaurant_id]
    @group_order.menu_id = params[:menu_id]
    @group_order.name = params[:name]
    @group_order.comment = params[:comment]   

    save_status = @group_order.save

    if save_status == true
      redirect_to("/group_orders/#{@group_order.id}", :notice => "Group order updated successfully.")
    else
      render("group_orders/edit.html.erb")
    end
  end

  def destroy
    @group_order = GroupOrder.find(params[:id])

    @group_order.destroy

    if URI(request.referer).path == "/group_orders/#{@group_order.id}"
      redirect_to("/group_orders", :notice => "Group order deleted.")
    else
      redirect_to(:back, :notice => "Group order deleted.")
    end
  end
end
