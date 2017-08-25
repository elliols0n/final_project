class DishesController < ApplicationController
  def index
    @dishes = Dish.all

    render("dishes/index.html.erb")
  end

  def show
    @dish = Dish.find(params[:id])

    render("dishes/show.html.erb")
  end

  def new
    @dish = Dish.new

    render("dishes/new.html.erb")
  end

  def create
    @dish = Dish.new

    @dish.name = params[:name]
    @dish.menu_id = params[:menu_id]

    save_status = @dish.save

    if save_status == true
      redirect_to("/menus/#{@dish.menu_id}", :notice => "Dish created successfully.")
    else
      render("dishes/new.html.erb")
    end
  end

  def edit
    @dish = Dish.find(params[:id])

    render("dishes/edit.html.erb")
  end

  def update
    @dish = Dish.find(params[:id])

    @dish.name = params[:name]
    @dish.menu_id = params[:menu_id]

    save_status = @dish.save

    if save_status == true
      redirect_to("/menus/#{@dish.menu_id}", :notice => "Dish updated successfully.")
    else
      render("dishes/edit.html.erb")
    end
  end

  def destroy
    @dish = Dish.find(params[:id])

    @dish.destroy

    if URI(request.referer).path == "/dishes/#{@dish.id}"
      redirect_to("/menus/#{@dish.menu_id}", :notice => "Dish deleted.")
    else
      redirect_to("/menus/#{@dish.menu_id}", :notice => "Dish deleted.")
    end
  end
end
