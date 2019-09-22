class ShortenedUrl < ApplicationRecord
  validates :long_url, presence: true
  validates :short_url, presence: true, uniqueness: true 
  validates :user_id, presence: true, uniqueness: true

  def self.random_code
    url = SecureRandom.urlsafe_base64
    exists = false
    while !exists
      exists = true
      if ShortenedUrl.exists?(url)
        url = SecureRandom.urlsafe_base64
        exists = false
        break
      end
    end
  end
end