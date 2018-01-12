# Technical test for clicrdv candidates

The goal of this test is to write an algorithm to retrieve the available time slots for a given calendar.

### Description

This project contains 4 simple models :
* Calendars : represents someone (a physical person who will be available for booking)
    * `name` : the name of the calendar  
* Interventions : represents something that can be booked (e.g. consultation for a doctor)
    * `name` : the name of the intervention
    * `length` : the duration of this intervention (in minutes)
    * `price` : the price of the intervention
* Openings : a time range during which a calendar is available
    * `calendar_id` : the calendar it refers to
    * `start_at` : the datetime at which the opening starts 
    * `end_at` : the datetime at which the opening finishes
* Appointments : an appointment booked by someone for an intervention with a calendar
    * `calendar_id` : the calendar it refers to
    * `intervention_id` : the intervention it refers to
    * `start_at` : the start date and time of the appointment
    * `end_at` : the end date and time of the appointment

### Getting started
In order to pass this test, follow those steps :

1. Fork this repository
2. Download or clone the forked repository locally
3. Run `bundle install`
4. Run `bundle exec rake db:setup` (make sure you have installed mysql)
5. Run `bundle exec rake db:migrate`
6. Run `rails s`
7. Navigate to localhost:3000
8. Start development...





