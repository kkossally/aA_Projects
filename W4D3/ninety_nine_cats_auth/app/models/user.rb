# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord

  validates :username, :session_token, presence: true, uniqueness: true
  # validates : :password_digest nu


  after_initialize :ensure_session_token 

  attr_reader :password
  
  def self.find_by_credentials(username, password) 
    user = User.find_by(username: username)
    return nil unless user && user.is_password?(password) 
    user
  end 


  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
    self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    bcrypt_pw = BCrypt::Password.new(self.password_digest)
    bcrypt_pw.is_password?(password) 
  end 

  def ensure_session_token
    self.session_token ||= self.reset_session_token 
  end 

end
