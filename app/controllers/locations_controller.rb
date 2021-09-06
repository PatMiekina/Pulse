class LocationsController < ApplicationController
  before_action :find_location, only: [:show, :edit, :update, :destroy]

  def index
    @locations = Location.all
  end

  def show
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to location_path(@location)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @location.update(location_params)
    if @location.save
      redirect_to location_path(@location)
    else
      render :edit
    end
  end

  def destroy
    @location.delete
  end

  private

  def location_params
    params.require(:location).permit(:name, :address)
  end

  def find_location
    @location = Location.find(params[:location])
  end

end
