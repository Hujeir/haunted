# README
1. Project Overview
The Grimwood Grand Hotel Management System is a Ruby on Rails web application designed to help hotel staff manage bookings and employee records. The system includes two main dashboards:
Booking Management Dashboard
Displays all hotel reservations and allows real-time client-side filtering based on booking status (Reserved, Checked-In, Checked-Out).
Staff Management Dashboard
Displays all employee records and includes real-time client-side sorting by Name, Department, Years of Service, and Status.
PostgreSQL is used as the database backend, and all styling is custom-made to match a spooky haunted-hotel aesthetic.
This project follows MVC architecture, Rails conventions, and all validations required by the business rules.

2. How to Run the Project
Prerequisites
-Ruby
-Rails
-PostgreSQL
-undler installed:
    -gem install bundler

Setup Instructions
-bundle install
-rails db:create
-rails db:migrate
-rails db:seed
-rails server

Then open the app at:
http://localhost:3000
Note: Challange #8 at the bottom

3. Data Models & Validations
Booking Model
Attributes:
-confirmation_number — presence, uniqueness
-guest_name — presence
-room_number — presence, numericality: > 0
-check_in_date — presence
-check_out_date — presence, must be after or equal to check_in_date
-status — inclusion in: Reserved, Checked-In, Checked-Out

StaffMember Model
Attributes:
-name — presence
-department — presence
-years_of_service — presence, numericality ≥ 0
-employment_status — inclusion in: active, on_leave, retired

Both models are intentionally not associated

4. JavaScript Features
Booking Dashboard — Real-Time Filtering
The bookings index page includes a dropdown filter that allows users to instantly show or hide booking rows based on the selected status.

Staff Dashboard — Real-Time Sorting
The staff page allows users to sort table rows by clicking column headers (Name, Department, Years of Service, Status).

5. Challenges & Solutions

Challenge 1 — Room Number Validation Missing Numericality
-Issue:
The initial Booking model validation only checked for presence of room_number, but did not ensure the number was greater than zero.
-Cause:
I forgot to include: numericality: { greater_than: 0 }
-Solution:
I updated the validation to enforce the correct business rule.
-What I Learned:
Presence alone is not sufficient for numeric fields — business logic must be explicitly validated.

Challenge 2 — Missing index Actions in Controllers
-Issue:
The Bookings and StaffMembers controllers raised errors because no index action was defined.
-Cause:
I generated controllers but forgot to implement the index method.
-Solution:
I added:
def index
  @bookings = Booking.all
end
and similarly for StaffMembersController.
-What I Learned:
Rails routing depends on matching controller actions; without them, even simple index views break.

Challenge 3 — Missing only: in Routes
-Issue:
My routes caused an ArgumentError because I wrote:
resources :bookings, [:index]
instead of:
resources :bookings, only: [:index]
-Solution:
I corrected the routes for both models.
-What I Learned:
Rails route syntax is strict — a missing keyword can break the entire controller mapping.

Challenge 4 — Sorting Not Working Due to Extra Whitespace
-Issue:
Sorting on the Staff page did nothing when clicking the headers.
-Cause:
Table cells contained hidden whitespace/newlines.
textContent compares strings literally, so " active" is not equal to "active".
-Solution:
I added .trim() in the sorting function:
let valA = a.querySelector("." + column).textContent.trim();
let valB = b.querySelector("." + column).textContent.trim();
-What I Learned:
Client-side data often contains formatting whitespace — trimming is essential for accurate comparisons.

Challenge 5 — Turbo Blocking Inline JavaScript
-Issue:
Some JavaScript (especially sorting) didn’t trigger when clicking headers.
-Cause:
Rails 7 Turbo sometimes prevents inline JS from attaching event listeners.
-Solution:
I added: data-turbo="false" to the table.
-What I Learned:
Turbo is powerful but can interfere with custom JS; disabling it selectively is a clean workaround.

Challenge 6 — Styling Across Multiple Pages
-Issue:
I wanted a consistent spooky theme across booking, staff, and landing pages.
-Cause:
Each page needed custom structural classes while sharing common colors and effects.
-Solution:
I created reusable CSS classes in application.css such as:
.spooky-table
.spooky-btn
.page-header
-What I Learned:
Consistent UI requires shared components and clear CSS structure, especially with multiple views.

Challenge 7 — Filter Was Not Resetting the Table Correctly
-Issue:
When I implemented the filtering feature on the Booking page, selecting a filter worked, but clicking “Clear Filters” did not restore all the original rows. Some rows remained hidden even though no filter should have been active.
-Cause:
I had set the display: none style on rows when filtering, but when clearing, I forgot to reset the display style back to the default (""). That meant the table never fully returned to its original unfiltered state.
-Solution:
I fixed the reset logic to explicitly show every row again:
rows.forEach row => 
    row.style.display 
And I ensured the filter dropdown resets:
    statusFilter.value = "";
-What I Learned:
Client-side filtering requires careful handling of state. It’s not enough to just hide matching rows — you must also restore all rows when filters are cleared. Reset logic needs to be explicit to guarantee the table returns to its full original dataset.


Challenge 8 — Booking Filter Did Not Work Until Browser Refresh
-Issue:
After updating the database and re-running the Rails server, the filtering feature on the Booking page stopped working. Even though the JavaScript was correct, selecting a status (Reserved, Checked-In, etc.) did nothing and all rows remained visible.
-Cause:
The browser was still using an old cached version of the page’s HTML and JavaScript. Rails automatically reloads code on the server, but the browser may still display an outdated version of the view. Because of caching, the filtering script didn’t run with the new DOM until the page was manually refreshed.
-Solution:
I simply performed a full browser refresh (⌘ + R on Mac), which forced the browser to download the latest HTML and JavaScript. After refreshing, filtering worked exactly as expected.
-What I Learned:
Not every bug is caused by backend or JavaScript errors — sometimes the browser is still using outdated cached content. When debugging Rails applications with client-side scripts, it’s important to refresh the browser after migrations, seed changes, or view updates to ensure the newest code is loaded.