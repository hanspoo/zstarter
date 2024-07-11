import { BuildingLibraryIcon } from '@heroicons/react/24/solid';
import { useContext } from 'react';

import { Link } from 'react-router-dom';
import { AuthContext } from '../contexts/AuthContext';
import { OrgContext } from '../contexts/OrgContext';

export function Navbar() {
  const { user } = useContext(AuthContext);
  const { org } = useContext(OrgContext);
  return (
    <div className="navbar bg-base-300">
      <div className="navbar-start">
        <Link to="/" className="btn btn-ghost text-xl">
          <BuildingLibraryIcon className="w-6" /> {org?.name}
        </Link>
      </div>

      <div className="navbar-end mr-40">
        {user ? user.profile.given_name : ''}
      </div>
    </div>
  );
}
