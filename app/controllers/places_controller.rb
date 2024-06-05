class PlacesController < ApplicationController
  before_action :authenticate_user!

  def index
    @places = Place.all
  end

  def show
    @place = Place.find(params[:id])
    @entries = @place.entries.where(user_id: current_user.id)
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to places_path, notice: "Place added successfully"
    else
      render :new
    end
  end

  private

  def place_params
    params.require(:place).permit(:name)
  end
end
