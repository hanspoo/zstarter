import React, { useEffect, useState } from 'react';
import logo from './logo.svg';
import './App.css';
import { createZitadelAuth, ZitadelConfig } from '@zitadel/react';
import { Route, Routes } from 'react-router-dom';

import Login from './components/Login';
import Callback from './components/Callback';
import { RootState } from '@freedom/redux-store';
import { useSelector } from 'react-redux';

function App() {
  const { org } = useSelector((state: RootState) => state.config);
  const config: ZitadelConfig = {
    authority: import.meta.env.VITE_ZITADEL_SERVER || 'nada',
    client_id: org?.clientId,
    redirect_uri: `http://${org?.host}/admin/callback`,
    post_logout_redirect_uri: `http://${org?.host}/admin/callback`,
  };

  console.log({ config });

  const zitadel = createZitadelAuth(config);

  function login() {
    zitadel.authorize();
  }

  function signout() {
    console.log('signout');
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
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>Welcome to ZITADEL React</p>

        <Routes>
          <Route
            index
            element={
              <Login authenticated={authenticated} handleLogin={login} />
            }
          />
          <Route
            path="/admin/callback"
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
      </header>
    </div>
  );
}

export default App;
