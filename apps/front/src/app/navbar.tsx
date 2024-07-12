import { OrgContext } from '@freedom/components';
import { useContext } from 'react';
import { AuthComponent } from './auth-component';
import { Link } from 'react-router-dom';

export function Navbar({ loginSection = true }: { loginSection?: boolean }) {
  const { org } = useContext(OrgContext);
  return (
    <div className="navbar bg-base-200 rounded-md mt-1 flex justify-between w-full">
      <div>
        <a
          href={loginSection ? '/admin' : '/'}
          className="btn btn-ghost bg-base-100 text-xl"
        >
          {org?.name || '-- sin org'}
        </a>
      </div>
      {loginSection && (
        <div>
          <AuthComponent />
        </div>
      )}
    </div>
  );
}
