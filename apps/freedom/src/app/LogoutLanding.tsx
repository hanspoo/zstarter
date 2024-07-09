import { useEffect } from 'react';

type LogoutLandingProps = {
  signout: () => void;
};
export function LogoutLanding({ signout }: LogoutLandingProps) {
  useEffect(() => {
    signout();
  }, []);

  return <p>Sesión finalizada</p>;
}
