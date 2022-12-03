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

FROM --platform=linux/amd64 python:3.9

COPY docker-entrypoint.sh ./

# Prevent Python from creating .pyc files, poluting the container
ENV PYTHONUNBUFFERED=1 PYTHONDONTWRITEBYTECODE=1

ENV POETRY_VERSION=1.2.2 \
    POETRY_HOME="/opt/poetry" \
    # Prevent Poetry from displaying prompts
    POETRY_NO_INTERACTION=1

RUN apt-get update \
    && apt-get install -y curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sSL https://install.python-poetry.org | python

# Add Poetry to PATH so that it can be used in subsequent commands
ENV PATH="$POETRY_HOME/bin:$PATH"

WORKDIR litecord/

COPY pyproject.toml poetry.lock ./

RUN poetry install --without dev

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["poetry", "run", "hypercorn", "run:app"]
