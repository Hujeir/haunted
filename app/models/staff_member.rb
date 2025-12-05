class StaffMember < ApplicationRecord
  validates :name, presence: true
  validates :department, presence: true
  validates :years_of_service, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :employment_status, presence: true, inclusion: { in: ["active", "on_leave", "retired"] }
end
