# README

a7la messa 3alika ya zmily

### Requirements:
Implement new feature to send due date reminder emails to the users based on 
their profile configuration.

### Running app:
- `bundle install`
- `rails db:migrate`
- `rails s`

### Running Tests
- Individual test files: `ruby -I test path/to/testfile.rb`
- All test suite: `rake test`

### dependencies:
[Redis](https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-redis-on-ubuntu-20-04#step-1-%E2%80%94-installing-and-configuring-redis)


### Sidekiq
to view sidekiq jobs after running `rails s` visit: http://localhost:3000/sidekiq.
