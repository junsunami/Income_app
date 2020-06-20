FROM ruby:2.7.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /Income_app

ENV APP_ROOT /Income_app
WORKDIR $APP_ROOT

ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

# Gemfileのbundle install
RUN bundle install
ADD . $APP_ROOT


