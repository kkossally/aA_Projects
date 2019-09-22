# == Schema Information
#
# Table name: post_subs
#
#  id      :bigint           not null, primary key
#  sub_id  :integer
#  post_id :integer
#

class PostSub < ApplicationRecord
  belongs_to :sub

  belongs_to :post
end
