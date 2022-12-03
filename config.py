"""
Litecord
Copyright (C) 2018-2021  Luna Mendes and Litecord Contributors
Copyright (C) 2022  Bluenix and Litecord Docker Service Contributors

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, version 3 of the License.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
"""

import os


MODE = "DockerService"


class DockerService:
    """Configuration for running Litecord in a Service."""

    MAIN_URL = os.environ["LITECORD_HOSTNAME"]
    NAME = "Litecord/Docker"  # Name of this specific instance
    DEBUG = False  # Debug logging

    #: Enable ssl?
    #  many routes will start giving https / wss
    #  urls depending of this config.
    IS_SSL = False

    # enable registrations in this instance?
    REGISTRATIONS = False

    # what to give on gateway route?
    # this must point to the websocket.

    # Set this url to somewhere *your users*
    # will hit the websocket.
    # e.g 'gateway.example.com' for reverse proxies.
    WEBSOCKET_URL = f"{MAIN_URL}:5001"

    # Set these to file paths if you want to enable raw TLS support on
    # the websocket (without NGINX)
    WEBSOCKET_TLS_CERT_PATH = None
    WEBSOCKET_TLS_KEY_PATH = None

    #: Where to host the websocket?
    #  (a local address the server will bind to)
    WS_HOST = "0.0.0.0"
    WS_PORT = 5001

    #: Mediaproxy URL on the internet
    #  mediaproxy is made to prevent client IPs being leaked.
    #  None is a valid value if you don't want to deploy mediaproxy.
    MEDIA_PROXY = f"{MAIN_URL}:5002"

    POSTGRES = {
        "host": os.environ["POSTGRES_HOST"],
        "user": os.environ["POSTGRES_USER"],
        "password": os.environ["POSTGRES_PASSWORD"],
        "database": os.environ["POSTGRES_DB"],
    }

    LVSP_SECRET = ""  # Shared secret for LVSP

    # Admin ID and token configuration
    ADMIN_ID = os.getenv("ADMIN_ID")
    ADMIN_TOKEN = os.getenv("ADMIN_TOKEN")

    if ADMIN_ID is not None:
        ADMIN_ID = int(ADMIN_ID)
