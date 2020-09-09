FROM ruby:2.3-alpine

WORKDIR /usr/src/xpteamwise

COPY Gemfile Gemfile.lock ./

RUN bundle install --without development test

COPY . ./

CMD sh
