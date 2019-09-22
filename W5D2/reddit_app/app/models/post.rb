# == Schema Information
#
# Table name: posts
#
#  id      :bigint           not null, primary key
#  title   :string
#  url     :string
#  content :text
#  sub_id  :integer #!!!get rid of sub_id 
#  user_id :integer
#

class Post < ApplicationRecord
  validates :title, presence: true

  belongs_to :author,
    foreign_key: :user_id,
    class_name: :User

  has_many :postsubs, dependent: :destroy, inverse_of: :post

  has_many :subs, through: :postsubs

end
