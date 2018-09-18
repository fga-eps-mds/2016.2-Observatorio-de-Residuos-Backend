#!/bin/sh

cmd="$@"

echo ">>>>> PID VERIFICATION <<<<<"
pidfiles="tmp/pids/*.*"
rm -rf $pidfiles
echo "PID folder cleaned!"

bundle install

echo ">>>>> DATABASE VERIFICATION <<<<<"
if bundle exec rake db:exists; then
    echo ">>>>> DATABASE DETECTED APPLYING MIGRATIONS <<<<<"
    bundle exec rake db:migrate
else
    echo ">>>>> NO DATABASE DETECTED CREATING A NEW ONE <<<<<"
    mysql --host=mysql -uroot --execute='CREATE DATABASE IF NOT EXISTS `observatorio_development` CHARACTER SET utf8 COLLATE utf8_general_ci' -p$MYSQL_ROOT_PASSWORD
    mysql observatorio_development < db/banco_observatorio.sql -uroot -p$MYSQL_ROOT_PASSWORD --host=mysql
    bundle exec rake db:migrate
fi

exec $cmd