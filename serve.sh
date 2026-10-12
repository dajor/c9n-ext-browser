#!/bin/sh
# Playwright server on port 9300, reachable only under /<token>. c9n hands the token over as C9N_EXT_TOKEN.
set -eu
[ -n "${C9N_EXT_TOKEN:-}" ] || { echo "C9N_EXT_TOKEN fehlt" >&2; exit 1; }
exec playwright run-server --host 0.0.0.0 --port 9300 --path "/${C9N_EXT_TOKEN}"
