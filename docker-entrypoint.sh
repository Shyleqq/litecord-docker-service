#!/bin/sh

# Litecord Docker Service
# Copyright (C) 2022  Bluenix and Litecord Docker Service Contributors
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

# Generate an ADMIN_ID for Litecord to read, unless already set
if [[ -z $ADMIN_ID ]]; then
    user_token=$(poetry run ./manage.py addbot "Testing bot" testing@example.com password)

    export ADMIN_ID=$(cut -f -d '.' $user_token | base64 --decode)
fi

exec "$@"
