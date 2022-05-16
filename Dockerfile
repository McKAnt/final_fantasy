FROM ruby:3.1.2
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

ENV RAILS_ENV=production
CMD ["bin/rails", "server"]
EXPOSE 3000
