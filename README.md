# Zitadel React + NX + Tailwind

This is a multi tenancy project, each organization with its independent space, using zitadel as the authentication provider.

Each organization is created in zitadel and in the app's database.

Two circuits:

- A public circuit where you can enter articles anonymously.
- A circuit where you can log in and reach a data management dashboard.

Start zitadel in docker compose under the zitadel-server folder.

Create organizations in the database, important the host and client_id, and the zitadel daisyui theme.

Gotchas:
How to determine the organization where nobody is logged in ?:
Using the hostname of the request to look up in the database, in order to keep firefox crypto libs calm, for development
you should use hostnames ending in localhost.

Next:
We need to validate the JWT in the backend, probably in express and passport.
