# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  COLORS = ["Red", "Green", "Blue"]
  
  validates :birth_date, presence: true
  validates :color, presence: true, inclusion: { in: COLORS,
      message: 'must choose color from options' }
  validates :name, presence: true
  validates :sex, presence: true, inclusion: { in: %w(M F),
      message: 'must choose sex from options' }
  validates :description, presence: true

  has_many :rental_requests,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest,
    dependent: :destroy

end
