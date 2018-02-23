#!/bin/bash
[[ -n "${DEBUG}" ]] && set -x
set -e -o pipefail

declare -a PGCLI_OPTS=()

[[ -n "${POSTGRES_HOST:-}" ]] && PGCLI_OPTS+=(--host "$POSTGRES_HOST")
[[ -n "${POSTGRES_USER:-}" ]] && PGCLI_OPTS+=(--username "$POSTGRES_USER")
[[ -n "${POSTGRES_DB:-}" ]] && PGCLI_OPTS+=(--dbname "$POSTGRES_DB")

if [[ -n "$POSTGRES_DB" ]] && [[ -n "$POSTGRES_USER" ]] && [[ -n "$POSTGRES_PASSWORD" ]]; then
    echo "${POSTGRES_HOST:=localhost}:${POSTGRES_PORT:-5432}:${POSTGRES_DB}:${POSTGRES_USER}:${POSTGRES_PASSWORD}" > "$HOME/.pgpass"
    chmod go-rwx "$HOME/.pgpass"
fi

if [[ -x "$1" ]]; then
    exec "$@"
else
    [[ "$1" = "pgcli" ]] && shift
    PGCLI_OPTS+=("$@")
    [[ 0 -eq "${#PGCLI_OPTS[@]}" ]] && PGCLI_OPTS=(--help)
    exec /usr/local/bin/pgcli "${PGCLI_OPTS[@]}"
fi
