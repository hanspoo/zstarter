import { ZitadelUser } from '@freedom/api-interfaces';
import React from 'react';

type AuthContext = {
  authenticated: boolean | undefined | null;
  user?: ZitadelUser | null;
};

export const AuthContext = React.createContext<AuthContext>({
  authenticated: undefined,
  user: undefined,
});
