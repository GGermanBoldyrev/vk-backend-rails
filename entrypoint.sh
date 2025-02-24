#!/bin/bash

echo "Starting entrypoint script..."

# Запуск миграций
echo "Running database migrations..."
bundle exec rake db:create db:migrate

# Проверка, были ли сидеры уже выполнены
if ! bundle exec rake db:seed:check; then
  echo "Running database seeds..."
  bundle exec rake db:seed
else
  echo "Seeds already run."
fi

# Удаляем старый pid файл, если он существует
rm -f tmp/pids/server.pid

# Запуск Rails сервера
echo "Starting Rails server..."
exec "$@"
