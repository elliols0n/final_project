class CuisinesController < ApplicationController
  def index
    @cuisines = Cuisine.all

    render("cuisines/index.html.erb")
  end

  def show
    @cuisine = Cuisine.find(params[:id])

    render("cuisines/show.html.erb")
  end

  def new
    @cuisine = Cuisine.new

    render("cuisines/new.html.erb")
  end

  def create
    @cuisine = Cuisine.new

    @cuisine.name = params[:name]

    save_status = @cuisine.save

    if save_status == true
      redirect_to("/cuisines/#{@cuisine.id}", :notice => "Cuisine created successfully.")
    else
      render("cuisines/new.html.erb")
    end
  end

  def edit
    @cuisine = Cuisine.find(params[:id])

    render("cuisines/edit.html.erb")
  end

  def update
    @cuisine = Cuisine.find(params[:id])

    @cuisine.name = params[:name]

    save_status = @cuisine.save

    if save_status == true
      redirect_to("/cuisines/#{@cuisine.id}", :notice => "Cuisine updated successfully.")
    else
      render("cuisines/edit.html.erb")
    end
  end

  def destroy
    @cuisine = Cuisine.find(params[:id])

    @cuisine.destroy

    if URI(request.referer).path == "/cuisines/#{@cuisine.id}"
      redirect_to("/", :notice => "Cuisine deleted.")
    else
      redirect_to(:back, :notice => "Cuisine deleted.")
    end
  end
end
