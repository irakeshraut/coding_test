# Thank you

First of all I would like to thank you all for giving me opportunity to do this coding test.

# Versions

Ruby - 2.7.5
Rails - 7.0.3
Database: Postgres

# Initial Setup

1. git clone git@github.com:rautrakesh/coding_test.git
2. cd coding_test
3. bundle install
4. rake db:create
5. rake db:migrate
6. rake db:seed
7. rails server

# Run Rspec

bundle exec rspec

# Seed Data from CSV file

you can find logic to seed data inside `seed.rb` file. You can run `rake db:seed` to import data from csv file to database`

# Viewing Properties Json

To view all Properties (default pagination setup for 30 properties)

http://localhost:3000/api/v1/properties

To Paginate (we don't have enough data for pagination so it will return empty array

http://localhost:3000/api/v1/properties?page=2

# Jbuilder and Will Paginate

I used Jbuilder gem to create json object and will paginate gem to do pagination of properties.

Jbuilder setup can be found in `app/views/api/v1/properties/index.json.jbuilder`

# Testing

I am using Rspec for Model and Controller testing. Normally I also use FactoryBot and Faker Gem to create objects but since this project is so small I decided not to use them.

# Thank You

Once again thank you very much for giving me this opportunity and taking time to review my code.
