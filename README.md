# Letting Agent

## Project Setup

1. Clone the project from GitHub
2. `cd LettingAgent` cd into the app folder.
3. `gem install pg` to install the pg gem.
4. `createdb letting_agent` to create the database.
5. `psql -d letting_agent -f db/letting_agent.sql` to create tables structure.
6. `ruby db/seeds.rb` to populate sample data.
7. `ruby app.rb` to launch the app.
6.  Open http://localhost:4567 to view the app in the browser.

## The Brief

You have been approached by the management of a letting agency and have been asked to create a system to manage their properties.  They need a system that allows them to manage rentals and their tenants.

### User Stories - MVP

| As a  | I want to be able to  | So that |
|---|---|---|
| Manager | View accurate data about my properties | I can keep my system up to date |
| Manager | Manage my new tenants | I can keep my system up to date |
| Manager | Process rentals| I can keep customers happy |
| Manager | See the details of the propertiess which are currently rented | I can keep track of my properties |


### Acceptance Criteria - MVP

Managers should be able to:
* Create new properties for rental
* Delete existing properties
* Add new customers to their list of registered tenants
* Update the details of their existing tenants
* Remove tenanta
* Assign properties to tenants
* Check rented properties back into available properties when they become available
* View a list of all of their rentals

### User Stories - Possible Extensions

| As a  | I want to be able to  | So that |
|---|---|---|
| Store Manager | Search for stock items | I can find information quickly |
| Store Manager | Filter properties by category | I can see relevant items for the tenant quickly |

### Acceptance Criteria - Possible Extensions

* Create a search bar that returns data valid for the users input
* Create a filter dependant on product attributes (eg flats: studio/1-bed/2-bed)
