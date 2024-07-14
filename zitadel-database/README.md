# Zitadel with data preloaded

This folder has a compose file that will start a postgresql database
with organizations, projects and applications preloaded:

In order to start download and install zitadel locally.

Steps:

1.- Download and install zitadel in your machine:

https://zitadel.com/docs/self-hosting/deploy/overview

2.- Start docker compose in this folder.

```
cd zitadel-preloaded
docker compose up -d
```

This will run postgres in port 5433.

3- Execute run-zitadel.sh.

This will start your local zitadel pointing to the database just started.

4.- Go to zitadel admin console and you will see the organizations.

Remember the password will be Password2!

http://localhost:8080

## Organizations present in the database:

Each organizations has credentials for front end and backend.

### Zitadel

Admin password changed to: Password2!

A project called zstarter and two applications:

#### zstarter web (PKCE)

client id: 275846173430973396@zstarter

redirect uri:
http://localhost:4200

#### zstarter api (Basic)

- ClientId: 275846219585094612@zstarter
- ClientSecret: xuGzWLnulSRQOskfqTCuxlvz3ivzIAkkTqUq5knnSuw3kUEzBRSiQCABBc5JNpmN

### Dinobank

Project zstarter and two applications:

#### zstarter web

client id: 275845904743859156@zstarter

Redirect uri
http://dinobank.localhost:4200

#### zstarter api

- ClientId: 275845978462946260@zstarter
- ClientSecret: z3TXyfiXWOsEZknTTyGAHqtnMvaGPyKh2Dp8gzEcv1MFrqgfErfANCWOnFXws2Xf

### Dogs Inc

Project zstarter and two applications:

#### zstarter web

client id: 275846377307702228@zstarter
redirect uri: http://dogsinc.localhost:4200

#### zstarter api

- ClientId: 275846432437634004@zstarter
- ClientSecret: nc53kCbVs23qKxDMMIRxmf8o5hno37etVoxjGGteq6KDzBr3ooRQ6qpLvxuCdcTg
