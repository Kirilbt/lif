class SpacesController < ApplicationController
  before_action :set_space, only: [:show]

  def index
    if params[:query].present?
      @spaces = Space.search_by_address(params[:query])
    else
      @spaces = Space.all
    end

    @markers = @spaces.geocoded.map do |space|
      {
        lat: space.latitude,
        lng: space.longitude,
        info_window: render_to_string(partial: "info_window", locals: { space: space }),
        image_url: helpers.asset_url("location.svg")
      }
    end
  end

  def show
    @booking = Booking.new
  end

  def new
    @space = Space.new
  end

  def create
    @space = Space.new(space_params)
    @space.user = current_user
    if @space.save
      redirect_to spaces_path
    else
      render :new
    end
  end

  def my_spaces
    @spaces = Space.where(user: current_user)
  end

  private

  def set_space
    @space = Space.find(params[:id])
  end

  def space_params
    params.require(:space).permit(:category, :price_day, :available, :info_space, :title, :address, :photo)
  end
end
