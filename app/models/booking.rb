class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  private

  def calculate_total_price
    if date_start && date_end && listing && listing.price_per_day
      duration_in_days = (date_end - date_start).to_i + 1
      duration_in_days = [duration_in_days, 1].max
      self.total_price = duration_in_days * listing.price_per_day
    else
      self.total_price = nil
    end
  end
end
