class ListingsController < ApplicationController

  def index
    @listings = Listing.all
  end

  def new
   @currentUser = current_user.id
   @listing = Listing.new
  end


  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    if @listing.save
    redirect_to listings_path
    else
    render :new, status: :unprocessable_entity
    end
  end


  private

  def listing_params
    params.require(:listing).permit(:album_name,:artist_name, :tracklist, :description, :genre, :youtube_url, :price_per_day)
  end
end
