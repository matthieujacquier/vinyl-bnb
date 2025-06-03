class BookingsController < ApplicationController
  def edit
  end

  def index
    @booking = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
  end

  def update
  end
end
