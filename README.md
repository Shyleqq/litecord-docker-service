# Litecord Docker Service

Docker image for the Litecord project to be used as a Service in GitHub Actions.

## Environment variables

To use this Docker container, there are a couple of environment variables
which need to be setup.

| Environment variable | Description |
| ADMIN_TOKEN          | Token for the bot to use; can be set to anything |
| ADMIN_ID*            | ID for the user the ADMIN_TOKEN should be for    |
| LITECORD_HOSTNAME    | Main URL hostname (name of service)              |
| POSTGRES_HOST        | Hostname for the PostgreSQL server               |
| POSTGRES_USER        | Name of the user to use in the PostgreSQL server |
| POSTGRES_PASSWORD    | Password to use for the user in the server       |
| POSTGRES_DB          | Database to connect to the in the server         |

\* This environment variable default's to a newly created user.
