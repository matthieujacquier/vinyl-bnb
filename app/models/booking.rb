class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  validate :date_start, presence: true
  validate :date_end, presence: true
end
