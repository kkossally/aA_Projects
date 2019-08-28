class ShortenedUrl < ApplicationRecord
  validates :long_url, presence: true
  validates :short_url, presence: true
  validates :user_id, presence: true, uniqueness: true

end