# zstarter

## Modern b2b project

Tech Stack: react, express, typescript, nx, zitadel, tailwind, daisyui

This is a multi tenancy project, each organization with its independant space

Uses zitadel as the authentication provider.

Each organization is created in zitadel and in the app's database.

Two circuits:

- A public circuit where you can enter articles anonymously.
- A circuit where you can log in and reach a data management dashboard.

## Required software

1.- Node 18 or superior is required, we recommend install with nvm:

https://github.com/nvm-sh/nvm

2.- Install nx globally

```
npm i -g nx
```

3.- Install zitadel server locally

Follow instructions here:

https://zitadel.com/docs/self-hosting/deploy/overview

4.- hosts file

In order for the different organizations to work, you must add two hosts to this machine. Add next line to your

/etc/hosts

file:

`127.0.0.1 dinobank.localhost dogsinc.localhost`

5.- Environment variables file

Rename .env.sample to .env.

## Start installation

1.- Clone and install this project

```
git clone https://github.com/hanspoo/zstarter
cd zstarter
npm install
```

2.- Start app database with organizations preloaded.

```
cd zstarter-preloaded
docker compose up -d
```

3.- Start zitadel database with orgnizations preloaded

```
cd zitadel-preloaded
docker compose up -d
```

4.- Start zitadel

```
cd zitadel-preloaded
./run-zitadel.sh
```

5.- Start back end express

```
nx serve web-server
```

6.- Start the front end

```
nx serve front
```

Contratulations

You can go to:
http://dinobank.localhost:4200/
or
http://dogsinc.localhost:4200/

or to the admin organization
http://localhost:4200/

Besides the name each one has a different daisyui theme.

For simplicity we are using the zitadel admin user, that can log in in any organization.

`zitadel-admin@zitadel.localhost`
with password
`Password2!`

Go to the zitadel admin panel at:

http://localhost:8080

And create users in the other organizations, and you will see that they as expected can only log in where they are registered:
