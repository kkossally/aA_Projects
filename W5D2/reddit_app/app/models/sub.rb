# == Schema Information
#
# Table name: subs
#
#  id          :bigint           not null, primary key
#  title       :string           not null
#  description :text             not null
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Sub < ApplicationRecord
  validates :title, :description, presence: true

  belongs_to :moderator,
    foreign_key: :user_id,
    class_name: :User

  has_many :postsubs, dependent: :destroy, inverse_of: :sub #why?

  has_many :posts, through: :postsubs #???? through joins table... h: gives access to post_id
end
