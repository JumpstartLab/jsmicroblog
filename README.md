# JSMicroBlog

This is an example tiny web application, built on Sinatra. It can be
used to practice integration testing via [watir][1] or [capybara][2].

## Running the app

The first time you enter the project directory, run `gem install bundler
&& bundle install` to load the dependencies.

After then, simply `bundle exec rackup` to run the app. You can also
`bundle exec rake test` to run the existing Test::Unit tests.

  1: http://rubygems.org/gems/watir
  2: http://rubygems.org/gems/capybara
