# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Booking.destroy_all
StaffMember.destroy_all

Booking.create!([
  {
    confirmation_number: "A1001",
    guest_name: "John Doe",
    room_number: 107,
    check_in_date: Date.today,
    check_out_date: Date.today + 2,
    status: "Reserved"
  },
  {
    confirmation_number: "A1002",
    guest_name: "Sarah Smith",
    room_number: 203,
    check_in_date: Date.today - 1,
    check_out_date: Date.today + 3,
    status: "Checked-In"
  },
  {
    confirmation_number: "A1003",
    guest_name: "Mike Johnson",
    room_number: 309,
    check_in_date: Date.today - 3,
    check_out_date: Date.today - 1,
    status: "Checked-Out"
  },
  {
    confirmation_number: "A1004",
    guest_name: "Emily Davis",
    room_number: 112,
    check_in_date: Date.today + 1,
    check_out_date: Date.today + 4,
    status: "Reserved"
  },
  {
    confirmation_number: "A1005",
    guest_name: "David Brown",
    room_number: 419,
    check_in_date: Date.today - 2,
    check_out_date: Date.today + 1,
    status: "Checked-In"
  },
  {
    confirmation_number: "A1006",
    guest_name: "Alice Moore",
    room_number: 101,
    check_in_date: Date.today,
    check_out_date: Date.today + 2,
    status: "Reserved"
  },
  {
    confirmation_number: "A1007",
    guest_name: "Brian Smith",
    room_number: 102,
    check_in_date: Date.today - 1,
    check_out_date: Date.today + 3,
    status: "Checked-In" 
  },
  {
    confirmation_number: "A1008",
    guest_name: "Cynthia Ray",
    room_number: 305,
    check_in_date: Date.today - 3,
    check_out_date: Date.today - 1,
    status: "Checked-Out"
  },
  {
    confirmation_number: "A1009",
    guest_name: "Daniel Lee",
    room_number: 110,
    check_in_date: Date.today + 1,
    check_out_date: Date.today + 2,
    status: "Reserved"
  },
  {
    confirmation_number: "A1010",
    guest_name: "Emily Carter",
    room_number: 409,
    check_in_date: Date.today - 2,
    check_out_date: Date.today + 1,
    status: "Checked-In"
  }
])

StaffMember.create!([
  { name: "Anna Hart", department: "Front Desk", years_of_service: 5, employment_status: "active" },
  { name: "George King", department: "Maintenance", years_of_service: 12, employment_status: "active" },
  { name: "Lisa Ray", department: "Housekeeping", years_of_service: 3, employment_status: "on_leave" },
  { name: "Mark Stone", department: "Security", years_of_service: 8, employment_status: "active" },
  { name: "Cindy Lee", department: "Dining", years_of_service: 15, employment_status: "retired" },
  { name: "Oliver Black", department: "Valet", years_of_service: 0, employment_status: "active" },
  { name: "Harriet Moon", department: "Front Desk", years_of_service: 25, employment_status: "retired" },
  { name: "Peter Wells", department: "Maintenance", years_of_service: 6, employment_status: "on_leave" },
  { name: "Sara Collins", department: "Dining", years_of_service: 1, employment_status: "active" },
  { name: "Victor Crane", department: "Security", years_of_service: 18, employment_status: "active" }
])
