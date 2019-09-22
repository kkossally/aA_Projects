# == Schema Information
#
# Table name: responses
#
#  id            :bigint           not null, primary key
#  respondent_id :integer          not null
#  answer_id     :integer          not null
#

class Response < ApplicationRecord
  validates :respondent_id, presence: true
  validates :answer_id, presence: true

  belongs_to :respondent,
    class_name: 'User',
    primary_key: :id,
    foreign_key: :user_id

  belongs_to :answer,
    class_name: 'AnswerChoice',
    primary_key: :id,
    foreign_key: :answer_id
  
end
