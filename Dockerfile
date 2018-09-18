FROM ruby:2.3.1

WORKDIR /code

ADD . /code

# RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

ENV MYSQL_ROOT_PASSWORD 123

RUN echo mysql-server mysql-server/root_password password $MYSQL_ROOT_PASSWORD | debconf-set-selections;\
  echo mysql-server mysql-server/root_password_again password $MYSQL_ROOT_PASSWORD | debconf-set-selections;\
  apt-get install -y mysql-server mysql-client libmysqlclient-dev

COPY entrypoint.sh /code
RUN ["chmod", "+x", "/code/entrypoint.sh"]
ENTRYPOINT ["sh", "/code/entrypoint.sh" ]

# CMD ["rails","server", "-b", "0.0.0.0"]
