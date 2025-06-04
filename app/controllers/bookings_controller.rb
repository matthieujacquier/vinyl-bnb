class BookingsController < ApplicationController
  #new booking must be created in association of a listing
  before_action :set_listing, only: [:new, :create]

  def index
    #only the users who are loged in
    @bookings = Booking.where(user_id: current_user.id)
  end

  def edit
  end


  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user #user_id
    @booking.listing = @listing #listing_id

    # Redirect to the booking page if saved, if not
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @booking.update(booking_params)
      redirect_to booking_path(@booking), notice: "Your booking is updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end


  private

  def set_listing
    @listing = Listing.find(params[:listing_id])
  end

  def booking_params
    params.require(:booking).permit(:date_start, :date_end, :status, :total_price)
  end
end
