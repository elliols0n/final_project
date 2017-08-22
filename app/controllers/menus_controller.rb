class MenusController < ApplicationController
  def index
    @menus = Menu.all

    render("menus/index.html.erb")
  end

  def show
    @menu = Menu.find(params[:id])

    render("menus/show.html.erb")
  end

  def new
    @menu = Menu.new

    render("menus/new.html.erb")
  end

  def create
    @menu = Menu.new

    @menu.restaurant_id = params[:restaurant_id]
    @menu.name = params[:name]

    save_status = @menu.save

    if save_status == true
      redirect_to("/menus/#{@menu.id}", :notice => "Menu created successfully.")
    else
      render("menus/new.html.erb")
    end
  end

  def edit
    @menu = Menu.find(params[:id])

    render("menus/edit.html.erb")
  end

  def update
    @menu = Menu.find(params[:id])

    @menu.restaurant_id = params[:restaurant_id]
    @menu.name = params[:name]

    save_status = @menu.save

    if save_status == true
      redirect_to("/menus/#{@menu.id}", :notice => "Menu updated successfully.")
    else
      render("menus/edit.html.erb")
    end
  end

  def destroy
    @menu = Menu.find(params[:id])

    @menu.destroy

    if URI(request.referer).path == "/menus/#{@menu.id}"
      redirect_to("/", :notice => "Menu deleted.")
    else
      redirect_to(:back, :notice => "Menu deleted.")
    end
  end
end
