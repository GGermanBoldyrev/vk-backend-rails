FROM ruby:latest

RUN apt-get update -qq && apt-get install -y postgresql-client nodejs

WORKDIR /myapp

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]