# Zitadel React + NX + Tailwind

Adaptation of zitadel official react sample to nx and tailwindcss.

Start zitadel with docker compose under zitadel-server:

```
cd zitadel-server
docker compose up
```

In zitadel create a project and then a web app with the next redirect settings:

Redirect URIs:
`http://localhost:4200/callback`

Post Logout URIs:
`http://localhost:4200/callback`

Copy the client id in App.tsx:

```
const config: ZitadelConfig = {
authority: 'http://localhost:8080',
redirect_uri: 'http://localhost:4200/callback',
client_id: '275261872742138627@cocacola',
post_logout_redirect_uri: 'http://localhost:4200/callback',
};
```

Execute

`nx serve freedom`
