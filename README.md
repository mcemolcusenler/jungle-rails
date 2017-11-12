# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example. Some features still in development.


## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

## Screenshots

* ![Home Page](https://github.com/mcemolcusenler/jungle-rails/blob/master/docs/Home-Page.png)
* ![Sign Up Page](https://github.com/mcemolcusenler/jungle-rails/blob/master/docs/SignUp-Page.png)
* ![Adding an Item to the Cart](https://github.com/mcemolcusenler/jungle-rails/blob/master/docs/Adding-to-Cart.png)
* ![Placing an Order](https://github.com/mcemolcusenler/jungle-rails/blob/master/docs/Placing-Order.png)
* ![Submitting a Product Review](https://github.com/mcemolcusenler/jungle-rails/blob/master/docs/Submitting-Review.png)
* ![Displaying Product Reviews](https://github.com/mcemolcusenler/jungle-rails/blob/master/docs/Displaying-Review.png)
