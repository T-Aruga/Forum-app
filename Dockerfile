FROM ruby:2.6.3

RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs     

RUN gem install bundler -v 1.17.3

WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install

WORKDIR /Forum-app
COPY . /Forum-app