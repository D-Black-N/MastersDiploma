FROM ruby:3.4.4-slim-bookworm

RUN apt-get update && apt-get install -y build-essential libpq-dev ruby-dev libyaml-dev

RUN mkdir /app
WORKDIR /app

COPY Gemfile* .
RUN bundle

CMD bundle exec rails s -b 0.0.0.0
