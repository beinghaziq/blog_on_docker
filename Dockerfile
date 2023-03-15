FROM ruby:2.6.3
RUN apt-get update -qq \
    && apt-get install -yqq --no-install-recommends \
        postgresql-client \
        nodejs \
        qt5-default \
        libqt5webkit5-dev \
    && apt-get -q clean \
    && rm -rf /var/lib/apt/lists

WORKDIR /usr/src/app
COPY Gemfile* ./
RUN gem install bundler
RUN bundle install
COPY . .
