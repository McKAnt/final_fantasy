# Based on: https://github.com/nickjj/docker-rails-example/blob/main/Dockerfile
FROM ruby:3.1.2
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

ENV SECRET_KEY_BASE=asdf
ENV RAILS_ENV=production
ENV RAILS_LOG_TO_STDOUT=yup

# TODO: Move build to a separate stage and remove the serving of static files
RUN bin/rails assets:precompile
ENV RAILS_SERVE_STATIC_FILES=yup

CMD ["bin/rails", "server"]
EXPOSE 3000
