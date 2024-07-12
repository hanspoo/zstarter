import { Dashboard, PleaseLogin } from '@freedom/components';
import { useAuth } from 'react-oidc-context';
export function Authenticated() {
  const auth = useAuth();

  if (!auth.isAuthenticated) return <PleaseLogin />;

  return (
    <div>
      <div className="my-8">Welcome {auth.user?.profile?.sub}</div>
      <Dashboard />
    </div>
  );
}
