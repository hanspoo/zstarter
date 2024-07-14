# zstarter

## Modern b2b project

Tech Stack: react, express, typescript, nx, prisma, zitadel, tailwind, daisyui, resend and postgresql.

This is a multi tenancy project, each organization with its independant space

Uses zitadel as the IDP: identity provider.

Each organization is created in zitadel and in the app's database.

Working apps:

- Create articles, no login required.
- Log in with zitadel and get to a dashboard.
- Log out

...actually fixing sending email when you publish an article with resend.

## Required software

1.- Node 18 or superior is required, we recommend install with nvm:

https://github.com/nvm-sh/nvm

2.- Install nx globally

```
npm i -g nx
```

3.- Create network to connect zitadel database and server.

```
docker network create zitadel
```

4.- hosts file

In a multi tenancy environment host names are important, moreover when you are not logged in.

In order for the two organizations in this sample, dinobank and dogsinc to work, you must add two hosts to this machine. Add next line to your `/etc/hosts` file:

`127.0.0.1 dinobank.localhost dogsinc.localhost`

5.- Environment variables file

Rename .env.sample to .env

## Start installation

1.- Clone and install this project

```
git clone https://github.com/hanspoo/zstarter
cd zstarter
npm install
```

2.- Start app database with organizations preloaded.

```
cd zstarter-database
docker compose up -d
```

3.- Start zitadel database with orgnizations preloaded

```
cd zitadel-database
docker compose up -d
```

4.- Start zitadel server

```
cd zitadel-server
docker compose up -d
```

5.- Start back end express

```
nx serve web-server
```

6.- Start the front end

```
nx serve front
```

---

That's it

You can go to:
http://dinobank.localhost:4200/
or
http://dogsinc.localhost:4200/

or to the admin organization
http://localhost:4200/

Besides the name each one has a different daisyui theme.

For simplicity we are using the zitadel admin user, that can log in any organization.

`zitadel-admin@zitadel.localhost`
with password
`Password2!`

Go to the zitadel admin panel at:

http://localhost:8080

And create users in the other organizations, and you will see that they as expected can only log in where they are registered:
