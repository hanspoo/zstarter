import { useAuth } from 'react-oidc-context';
import { PleaseLogin } from '../PleaseLogin';
import { Dashboard } from '../admin/Dashboard';
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
