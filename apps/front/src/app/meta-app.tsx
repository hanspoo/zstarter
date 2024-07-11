import { Footer, LandingHome, Navbar } from '@freedom/components';
import { Route, Routes } from 'react-router-dom';
import App from './app';
import React, { useEffect, useState } from 'react';
import logo from './logo.svg';
import './App.css';
import { createZitadelAuth, ZitadelConfig } from '@zitadel/react';

import Login from './components/Login';
import Callback from './components/Callback';

export function MetaApp() {
  const config: ZitadelConfig = {
    authority: 'http://localhost:8080/',
    client_id: '275414623035917827@zitadel-project',
    redirect_uri: 'http://localhost:4200/admin/callback',
    post_logout_redirect_uri: 'http://localhost:4200/admin/callback',
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
    <div className="flex h-screen flex-col justify-between">
      <div>
        <Navbar />
        <Routes>
          <Route path="/" element={<LandingHome />} />
          <Route path="/admin/*">
            <Route
              path=""
              element={
                <Login authenticated={authenticated} handleLogin={login} />
              }
            />
            <Route
              path="callback"
              element={
                <Callback
                  authenticated={authenticated}
                  setAuth={setAuthenticated}
                  handleLogout={signout}
                  userManager={zitadel.userManager}
                />
              }
            />
          </Route>
        </Routes>
      </div>
      <Footer />
    </div>
  );
}
