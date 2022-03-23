class BookingsController < ApplicationController
  def new
    @space = Space.find(params[:space_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @space = Space.find(params[:space_id])
    @booking.space = @space
    @booking.user = current_user
    @booking.status = "Pending"
    if @booking.save
      redirect_to my_bookings_path(current_user)
    else
      render 'spaces/show'
    end
  end

  def my_bookings
    @bookings = Booking.where(user_id: current_user)
    # @bookings = Booking.find
    # bookings.each do |booking|
    #   if booking.user == current_user
    #     @user_booking = booking
    #   end
    # end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :space_id)
  end
end
