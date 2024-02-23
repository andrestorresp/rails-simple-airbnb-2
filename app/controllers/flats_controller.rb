class FlatsController < ApplicationController
  def index
    @flats = Flat.all
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def new
    @flat = Flat.new
  end

  def create #POST /flat
    raise
    @flat = Flat.new(params_flat)

    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new, status:  :unprocessable_entity
    end
  end

  def edit
    @flat = Flat.find(params[:id])
  end

  private

  def params_flat
    params.require(:flat).permit()
  end
  def update
    @flat = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)
    # No need for app/views/restaurants/update.html.erb
    redirect_to restaurant_path(@restaurant)
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end
end
