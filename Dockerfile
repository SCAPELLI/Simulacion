# Base image
FROM ruby:3.0.0

ENV HOME /home/rails/webapp

# Install PGsql dependencies and js engine
#RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs && apt-get install -y yarn

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -qq -y build-essential nodejs yarn \
    libpq-dev

WORKDIR $HOME

# Install gems
ADD Gemfile* $HOME/
RUN gem install bundler -v 2.2.15
RUN bundle install

# Add the app code
ADD . $HOME

# Default command
CMD ["rails", "server", "--binding", "0.0.0.0"]