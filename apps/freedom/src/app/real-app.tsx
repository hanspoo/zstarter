import React, { useEffect, useState } from 'react';
import logo from './logo.svg';

import { createZitadelAuth, ZitadelConfig } from '@freedom/zitadel-r';
import { BrowserRouter, Link, Route, Routes } from 'react-router-dom';

import Login from './components/Login';
import Callback from './components/Callback';
import { AdminHome } from './AdminHome';
import { LogoutLanding } from './LogoutLanding';

function RealApp() {
  const config: ZitadelConfig = {
    authority: 'http://localhost:8080',
    redirect_uri: 'http://localhost:4200/callback',
    client_id: '275261872742138627@cocacola',
    post_logout_redirect_uri: 'http://localhost:4200/callback',
  };

  const zitadel = createZitadelAuth(config);

  function login() {
    zitadel.authorize();
  }

  function signout() {
    zitadel.signout();
  }

  const [authenticated, setAuthenticated] = useState<boolean | null>(null);

  useEffect(() => {
    zitadel.userManager.getUser().then((user) => {
      if (user) {
        setAuthenticated(true);
      } else {
        setAuthenticated(false);
      }
    });
  }, [zitadel]);

  return (
    <div>
      <Routes>
        <Route
          path="/"
          element={<Login authenticated={authenticated} handleLogin={login} />}
        />
        <Route path="/admin" element={<AdminHome />} />
        <Route path="/logout" element={<LogoutLanding signout={signout} />} />
        <Route
          path="/callback"
          element={
            <Callback
              authenticated={authenticated}
              setAuth={setAuthenticated}
              handleLogout={signout}
              userManager={zitadel.userManager}
            />
          }
        />
      </Routes>
    </div>
  );
}

export default RealApp;
