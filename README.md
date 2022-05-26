# Thank you

First of all I would like to thank you all for giving me opportunity to do this coding test.

# Versions

Ruby - 2.7.5
Rails - 7.0.3
Database: Postgres

# Initial Setup

1. git clone
2. bundle install
3. rake db:create
4. rake db:migrate
5. rake db:seed
6. rails server

# Run Rspec

bundle exec rspec

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
