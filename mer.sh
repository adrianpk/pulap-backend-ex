#!/bin/bash
# Postgres 8.4-9.1
kc() {
  psql -d pulap_dev -c "$1"
}

clear;
kc "SELECT pg_terminate_backend(pid) FROM  pg_stat_activity WHERE pid <> pg_backend_pid() AND datname = 'pulap_dev';";
mix ecto.reset;
