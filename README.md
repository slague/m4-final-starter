# URLockBox Final Assessment

"URLockbox is a small application for tossing various forms of inspiration for later review."  A user creates an account and can save, edit, mark read, mark unread, and filter links. This app is used as the final assessment for module 4 of the backend engineering program at Turing School of Software and Design.

## Tech stack
 This is a Rails 5.0.0.1 application

## Setup
 Clone the repo
 Run `bundle`
 `rake db:create`
 `rake db:migrate`
 To run locally run `rails s` and open browser to localhost:3000

To view the app in production:
 [Production Link](https://mod-4-final-stephanie.herokuapp.com).

### Testing

This app uses Rspec for testing. To run tests `rspec`

## API

This app has one endpoint `POST '/api/v1/links` which can be used to update a 'link' record in the database.

## HotReads

This app has a service called "Hot Reads". When a user clicks 'read' on a link, the information is sent and stored by the "Hot Reads" app. You will see links marked as "hot reads" or as "top link" when you click 'mark as read', if the links are included in the hot reads list. Visit the repo to learn more or the production link to see it in action. Note: all post requests are being made to the "Hot Reads" production site.

[GitHub Repo](https://github.com/slague/hot_reads)
[Production](https://m4-hot-reads.herokuapp.com/)
