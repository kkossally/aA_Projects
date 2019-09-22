# == Schema Information
#
# Table name: polls
#
#  id      :bigint           not null, primary key
#  title   :string           not null
#  user_id :integer          not null
#

class Poll < ApplicationRecord
  validates :title, presence: true
  validates :user_id, presence: true

  belongs_to :author,
    class_name: 'User',
    primary_key: :id,
    foreign_key: :user_id

  has_many :questions,
    class_name: 'Question',
    primary_key: :id,
    foreign_key: :poll_id

end
