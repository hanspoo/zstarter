# Multi tenancy

Tech Stack: react, nx, zitadel, tailwind

This is a multi tenancy project, each organization with its independant space

Uses zitadel as the authentication provider.

Each organization is created in zitadel and in the app's database.

Two circuits:

- A public circuit where you can enter articles anonymously.
- A circuit where you can log in and reach a data management dashboard.

Start zitadel in docker compose under the zitadel-server folder.

Create organizations in the database, important the host and client_id, and the zitadel daisyui theme.

Gotchas:

Answer: How to determine the organization where nobody is logged in ?:
Response: Using the hostname of the request to look up in the database. In order to keep firefox crypto libs
calm, for development we ended up using hostnames ending in localhost.

Next:
We need to validate the JWT in the backend, probably in express and passport.
