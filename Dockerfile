# Based on: https://github.com/nickjj/docker-rails-example/blob/main/Dockerfile
FROM ruby:3.1.2
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

ENV SECRET_KEY_BASE=asdf
ENV RAILS_ENV=production
ENV RAILS_LOG_TO_STDOUT=yup
ENV RAILS_SERVE_STATIC_FILES=yup

# TODO: Move this to a separate stage
RUN bin/rails assets:precompile

CMD ["bin/rails", "server"]
EXPOSE 3000
