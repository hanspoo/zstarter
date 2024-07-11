import { User } from 'oidc-client-ts';

export function AuthenticatedUserComponent({
  userInfo,
  handleLogout,
}: {
  userInfo: User;
  handleLogout: any;
}) {
  return (
    <div className="user">
      <h2 className="m-4 ">Bienvenido, {userInfo.profile.name}!</h2>

      <button
        className="absolute right-3 top-[15px] btn btn-sm"
        onClick={handleLogout}
      >
        Log out
      </button>
    </div>
  );
}
