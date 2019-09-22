# == Schema Information
#
# Table name: answer_choices
#
#  id          :bigint           not null, primary key
#  text        :text             not null
#  question_id :integer          not null
#

class AnswerChoice < ApplicationRecord
  validates :text, presence: true
  validates :question_id, presence: true

  belongs_to :question,
    class_name: 'Question',
    primary_key: :id,
    foreign_key: :question_id

  has_many :responses,
    class_name: 'Reponses',
    primary_key: :id,
    foreign_key: :answer_id
  
end
