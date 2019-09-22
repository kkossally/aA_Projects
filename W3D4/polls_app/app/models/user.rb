# == Schema Information
#
# Table name: users
#
#  id       :bigint           not null, primary key
#  username :string           not null
#

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

has_many :polls,
  class_name: 'Poll',
  primary_key: :id,
  foreign_key: :user_id

has_many :responses,
  class_name: 'Response',
  primary_key: :id,
  foreign_key: :user_id
  
end
