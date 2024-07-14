import { useContext } from 'react';
import { AuthComponent } from './auth-component';
import { OrgContext } from '../contexts/OrgContext';
import { BuildingLibraryIcon } from '@heroicons/react/24/solid';
import { Link } from 'react-router-dom';

export function Navbar({ loginSection = true }: { loginSection?: boolean }) {
  const { org } = useContext(OrgContext);
  return (
    <div className="navbar bg-base-200 rounded-md mt-1 flex justify-between w-full">
      <div>
        <a
          href={loginSection ? '/admin' : '/'}
          className="btn btn-ghost text-xl"
        >
          <img
            alt={org?.name}
            src={`/org-icons/${org?.slug}.png`}
            className="w-8"
          />
          {org?.name || '-- sin org'}{' '}
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
