class BookingsController < ApplicationController
  #new booking must be created in association of a listing
  before_action :set_listing, only: [:new, :create]

  def index
    #only the users who are loged in
    @bookings = Booking.where(user_id: current_user.id)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = @listing.bookings.new(booking_params)
    @booking.user = current_user # user_id

    if @booking.date_start && @booking.date_end
      days = (@booking.date_end - @booking.date_start).to_i + 1
      @booking.total_price = days * @listing.price_per_day
    end

    if @booking.save
      flash[:notice] = "Booking for #{@listing.album_name} was successfully created!"
      redirect_to bookings_path
    else
      flash.now[:alert] = "Could not create booking: #{@booking.errors.full_messages.to_sentence}"
      render 'listings/show', status: :unprocessable_entity
    end
  end

  def my_booking_requests
    @user = current_user
    @bookings = Booking.where(user_id: current_user)
    @listings = Listing.where(user_id: current_user)
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.update(accepted: true)
    redirect_to my_booking_requests_path, notice: "Booking accepted."
  end

  def refuse
    @booking = Booking.find(params[:id])
    @booking.update(accepted: false)
    redirect_to my_booking_requests_path, notice: "Booking accepted."
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def edit
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
