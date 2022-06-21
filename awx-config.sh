#!/bin/bash

# This script comes with ABSOLUTELY NO WARRANTY, use at own risk
# Copyright (C) 2020 Osiris Alejandro Gomez <osiris@gcoop.coop>
# Copyright (C) 2020 Osiris Alejandro Gomez <osiux@osiux.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

AWX_GITLAB_USER='awx_gitlab_test'

stderror ()
{
  echo >&2 "$1"
}

function die()
{
  stderror "ERROR: $1"
  exit 1
}

[[ -z "$1"              ]] && die "EMPTY AWX_ENV, TRY develop"
AWX_ENV="$1"

AWX_HOSTS="inventory/awx-$AWX_ENV"
[[ -d 'tests'      ]] && AWX_HOSTS="tests/inventory/awx-$AWX_ENV"
[[ -e "$AWX_HOSTS" ]] || die "NOT FOUND FILE $AWX_HOSTS"

AWX_HOST="$(grep -v '\[' "$AWX_HOSTS" | head -1 | cut -d' ' -f1)"
[[ -z "$AWX_HOST"  ]] && die "EMPTY AWX_HOST"

AWX_URL="http://$AWX_HOST"

CONFIG=$(cat << EOF
host=$AWX_URL
password=$AWX_GITLAB_TEST
username=$AWX_GITLAB_USER
verify_ssl=false
EOF
)

AWX_CFG="$HOME/.tower_cli.cfg"
echo "$CONFIG" > "$AWX_CFG" && chmod 600 "$AWX_CFG"
