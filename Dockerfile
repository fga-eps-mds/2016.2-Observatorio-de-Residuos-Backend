FROM ruby:2.3.1

WORKDIR /code

ADD . /code

RUN bundle install

EXPOSE 3000

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -

RUN apt-get install -y nodejs

CMD ["rails","server", "-b", "0.0.0.0"]
