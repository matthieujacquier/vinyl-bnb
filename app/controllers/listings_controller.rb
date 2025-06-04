class ListingsController < ApplicationController

  def index
    @listings = Listing.all
  end

  def new
   @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    if @listing.save
      redirect_to listing_path(@listing)
    else
    render :new, status: :unprocessable_entity
    end
  end

  def my_listings
    @listings = Listing.where(user_id: current_user.id)
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def edit
    @listing = Listing.find(params[:id])
  end

   def update
    @listing = Listing.find(params[:id])
    if @listing.update(listing_params)
      redirect_to listing_path(@listing)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to listings_path, status: :see_other
  end

  private

  def listing_params
    params.require(:listing).permit(:album_name,:artist_name, :tracklist, :description, :genre, :youtube_url, :price_per_day, :photo)
  end
end
