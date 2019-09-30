class Bench < ApplicationRecord
  validates :description, presence: true
  validates :lat, presence: true
  validates :lng, presence: true
end