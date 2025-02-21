#!/bin/bash
set -e

until pg_isready -h db -p 5432; do
  echo "Waiting for postgres..."
  sleep 2
done

rm -f /app/tmp/pids/server.pid

exec "$@"