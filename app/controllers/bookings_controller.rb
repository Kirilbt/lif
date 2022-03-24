class BookingsController < ApplicationController

  # def new
  #   @space = Space.find(params[:space_id])
  #   @booking = Booking.new
  # end

  def create
    @booking = Booking.new(booking_params)
    @space = Space.find(params[:space_id])
    @booking.space = @space
    # redirect_to user_session_path and return unless user_signed_in?

    @booking.user = current_user
    @booking.status = "Pending"
    if @booking.save
      redirect_to my_bookings_path
    else
      render 'spaces/show'
    end
  end

  def my_bookings
    @bookings = Booking.where(user: current_user)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :space_id)
  end
end
