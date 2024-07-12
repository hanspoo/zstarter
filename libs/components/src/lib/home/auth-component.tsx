// src/App.jsx

import React from 'react';
import { useAuth } from 'react-oidc-context';
import { UserIcon } from '@heroicons/react/24/solid';

export function AuthComponent() {
  const auth = useAuth();

  switch (auth.activeNavigator) {
    case 'signinSilent':
      return <div>Signing you in...</div>;
    case 'signoutRedirect':
      return <div>Signing you out...</div>;
  }

  if (auth.isLoading) {
    return <div className="text-slate-400 text-xs mr-2">Loading...</div>;
  }

  if (auth.error) {
    return (
      <div className="flex flex-col items-center">
        <div className="mb-4 text-xs">Oops... {auth.error.message}</div>
        <a href="/" className="btn btn-sm btn-primary">
          Continuar
        </a>
      </div>
    );
  }

  if (auth.isAuthenticated) {
    return (
      <div className="flex flex-col items-center ">
        <div className="dropdown dropdown-end">
          <div
            tabIndex={0}
            role="button"
            className="btn btn-ghost btn-circle avatar w-8 h-8"
          >
            <UserIcon />
          </div>
          <ul
            tabIndex={0}
            className="menu menu-sm dropdown-content bg-base-100 rounded-box z-[1] mt-3 w-52 p-2 shadow"
          >
            <li>Logged as {auth.user?.profile?.sub}</li>
            <li>
              <button className="btn" onClick={() => void auth.removeUser()}>
                Log out
              </button>
            </li>
          </ul>
        </div>
      </div>
    );
  }

  return (
    <button
      className="btn btn-primary btn-sm mr-2"
      onClick={() => void auth.signinRedirect()}
    >
      Log in
    </button>
  );
}
