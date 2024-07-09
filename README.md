# Freedom

Adaptation of zitadel official react sample but with nx

IN the zitadel side configure:

Redirect URIs:
`http://localhost:4200/callback`

Post Logout URIs:
`http://localhost:4200/callback`

Add client id in App.tsx:

```
const config: ZitadelConfig = {
authority: 'http://localhost:8080',
redirect_uri: 'http://localhost:4200/callback',
client_id: '275261872742138627@cocacola',
post_logout_redirect_uri: 'http://localhost:4200/callback',
};
```
