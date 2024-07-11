import { useEffect, useState } from 'react';
import { UserManager, User } from 'oidc-client-ts';
import { AuthenticatedUserComponent } from './AuthenticatedUserComponent';
import { Link, Navigate } from 'react-router-dom';

type Props = {
  authenticated: boolean | null;
  setAuth: (authenticated: boolean | null) => void;
  userManager: UserManager;
  handleLogout: any;
};

const Callback = ({
  authenticated,
  setAuth,
  userManager,

  handleLogout,
}: Props) => {
  const [userInfo, setUserInfo] = useState<User | null>(null);

  console.log({
    authenticated,
    setAuth,
    userManager,

    handleLogout,
  });

  useEffect(() => {
    if (authenticated === null) {
      userManager
        .signinRedirectCallback()
        .then((user: User) => {
          if (user) {
            setAuth(true);
            setUserInfo(user);
          } else {
            setAuth(false);
          }
        })
        .catch((error: any) => {
          setAuth(false);
        });
    }
    if (authenticated === true && userInfo === null) {
      userManager
        .getUser()
        .then((user) => {
          if (user) {
            setAuth(true);
            setUserInfo(user);
          } else {
            setAuth(false);
          }
        })
        .catch((error: any) => {
          setAuth(false);
        });
    }
  }, [authenticated, userManager, setAuth]);
  if (authenticated === true && userInfo) {
    return (
      <AuthenticatedUserComponent
        userInfo={userInfo}
        handleLogout={handleLogout}
      />
    );
  } else {
    return null;
  }
};

export default Callback;
