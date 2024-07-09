import React, { useEffect, useState } from 'react';
import logo from './logo.svg';

import { createZitadelAuth, ZitadelConfig } from '@freedom/zitadel-r';
import { BrowserRouter, Link, Route, Routes } from 'react-router-dom';

import Login from './components/Login';
import Callback from './components/Callback';
import { AdminHome } from './AdminHome';
import { LogoutLanding } from './LogoutLanding';

function App() {
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
    <div className="h-screen max-w-[1280px] bg-sky-800 text-white m-auto flex flex-col items-center justify-center">
      <button>
        <a href="/">Reload</a>
      </button>
      <img src={logo} className="w-48" alt="logo" />
      <p>Welcome to ZITADEL React</p>

      <BrowserRouter>
        <Routes>
          <Route
            path="/"
            element={
              <Login authenticated={authenticated} handleLogin={login} />
            }
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
      </BrowserRouter>
    </div>
  );
}

export default App;
