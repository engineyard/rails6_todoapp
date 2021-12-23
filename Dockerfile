FROM ruby:2.7
LABEL maintainer="Kyle-Law"
# ARG RAILS_MASTER_KEY
# Allow apt to work with https-based sources
RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
   apt-transport-https
# Ensure we install an up-to-date version of Node
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
# Ensure latest packages for Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | \
   tee /etc/apt/sources.list.d/yarn.list
# Install packages
RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends nodejs yarn

# Install rails
RUN gem install rails -v '6.1.4'
COPY ./Gemfile* /usr/src/app/ 
WORKDIR /usr/src/app
RUN bundle install

COPY . /usr/src/app/

RUN rails webpacker:install

EXPOSE 3000

CMD ["bin/rails", "s", "-b", "0.0.0.0"]