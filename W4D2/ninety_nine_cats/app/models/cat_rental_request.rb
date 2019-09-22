class CatRentalRequest < ApplicationRecord
  validates :cat_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true, inclusion: { in: %w(PENDING APPROVED DENIED), 
    message: 'must select from choices' }
  validates :does_not_overlap_approved_request

  belongs_to :cat,
    foreign_key: :cat_id,
    class_name: :Cat

  def overlapping_requests

    CatRentalRequest.where
      .not('start_date > :end_date OR :start_date > end_date', start_date: self.start_date, end_date: self.end_date)
      .where('cat_id = ? AND id != ?', self.cat_id, self.id)
  end

  def overlapping_approved_requests
    overlapping_requests.where('status = \'APPROVED\'')
  end

  private
  def does_not_overlap_approved_request
    overlapping_approved_requests.exists?
  end

end