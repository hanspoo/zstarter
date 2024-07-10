import { RootState } from '@freedom/redux-store';
import { BuildingLibraryIcon } from '@heroicons/react/24/solid';
import { useSelector } from 'react-redux';
import { Link } from 'react-router-dom';

export function Navbar({ conLogin = true }: { conLogin?: boolean }) {
  const { org } = useSelector((state: RootState) => state.config);
  return (
    <div className="navbar bg-base-300">
      <div className="navbar-start">
        <Link to="/" className="btn btn-ghost text-xl">
          <BuildingLibraryIcon className="w-6" /> {org?.name}
        </Link>
      </div>
    </div>
  );
}
