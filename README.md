# Technical test for clicrdv candidates

The goal of this test is to validate the minimum skills of candidates required to be part of the team.

The candidate shall be able to understand the given code, write clean, documented and maintainable code
for availability calculation (depending on the given code & data) and test his code.

_TDD methodology is not required but highly recommended._

### Description

This project contains 4 simple models :
* Calendars : represents someone (a physical person who will be available for booking)
    * `name` : the name of the calendar
    * `interval` : the time difference (in minutes) between slots
* Interventions : represents something that can be booked (e.g. consultation for a doctor)
    * `calendar_id` : the id of the calendar which can perform this intervention
    * `name` : the name of the intervention
    * `duration` : the duration of this intervention (in minutes)
* Openings : a time range during which a calendar is available
    * `calendar_id` : the calendar it refers to
    * `start_at` : the datetime at which the opening starts
    * `end_at` : the datetime at which the opening finishes
* Appointments : an appointment booked by someone for an intervention with a calendar
    * `calendar_id` : the calendar it refers to
    * `intervention_id` : the intervention it refers to
    * `start_at` : the start date and time of the appointment
    * `end_at` : the end date and time of the appointment
    * `customer_name` : the name of the person who booked the appointment

### Goals

- First : Add the column to handle `intervals` on calendars. And remove the `price` column from interventions.
- Second : Opening model need mode validations, for example 2 openings can't overlap, should be defined between day boundaries, etc...
- Third : Update the existing tests following the previous changes
- Finally : Write the algorithm "availabilities" which will return the time slots where a calendar can be booked to realize an intervention, write the associated tests (minimum 80% coverage) and provide the necessary
api route.

Extra : Create a front page to display availabilities for one calendar.
You're free to use the css and JS frameworks. (bootstrap, material UI, foundation...)

##### Example

Imagine we have a calendar named _Dr Dupont_ which is open on the 01/11/2018 from **8 AM to 12 AM** and
configured with an interval of 10 minutes.
This calendar can do the interventions _massage_ (30 minutes) and _hair removal_ (40 minutes).
Two people already booked an appointment for this calendar :
- Toto booked a _massage_ at **9 AM**
- Max booked a _hair removal_ at **10 AM**

Regarding the given elements, if we ask for the available time slots of _Dr Dupont_, the 01/11/2018 for a _massage_,
the result shall be :

`["2018-01-11 08:00:00", "2018-01-11 08:10:00", "2018-01-11 08:20:00", "2018-01-11 08:30:00", "2018-01-11 09:30:00",
"2018-01-11 10:40:00", "2018-01-11 10:50:00", "2018-01-11 11:00:00", "2018-01-11 11:10:00", "2018-01-11 11:20:00", "2018-01-11 11:30:00"]`

### Getting started
In order to pass this test, follow those steps :

1. Fork this repository
2. Download or clone the forked repository locally
3. Run `bundle install`
4. Run `bundle exec rake db:setup` (make sure you have installed mysql)
5. Run `bundle exec rake db:migrate`
6. Run `rails s`
7. Navigate to localhost:3000 :boom:
8. Start development
9. Git commit and push when necessary. Use your favorite workflow & habits
