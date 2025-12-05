class Booking < ApplicationRecord
  validates :confirmation_number, presence: true, uniqueness: true
  validates :guest_name, presence: true
  validates :room_number, presence: true, numericality: { greater_than: 0 }
  validates :check_in_date, presence: true
  validates :check_out_date, presence: true
  validate  :dates_must_be_valid
  validates :status, presence: true, inclusion: { in: ["Reserved", "Checked-In", "Checked-Out"] }

  def dates_must_be_valid
    return unless check_in_date && check_out_date
    if check_out_date < check_in_date
      errors.add(:check_out_date, "must be after check-in date")
    end
  end
end
