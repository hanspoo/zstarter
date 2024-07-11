import { Navigate } from 'react-router-dom';

type Props = {
  handleLogin: () => void;
  authenticated: boolean | null;
};
const Login = ({ authenticated, handleLogin }: Props) => {
  return (
    <div>
      {authenticated === null && <div>Loading...</div>}
      {authenticated === false && (
        <div className="hero min-h-[640px]">
          <div className="hero-content text-center">
            <div className="max-w-md">
              <h1 className="text-4xl font-bold">Acceso al sistema</h1>
              <p className="py-6">
                Provident cupiditate voluptatem et in. Quaerat fugiat ut
                assumenda excepturi exercitationem quasi. In deleniti eaque aut
                repudiandae et a id nisi.
              </p>
              <button
                className="btn btn-primary"
                onClick={() => {
                  // Perform the authorization request, including the code challenge
                  handleLogin();
                }}
              >
                Login
              </button>
            </div>
          </div>
        </div>
      )}
      {authenticated && <Navigate to="/admin/callback" />}
    </div>
  );
};

export default Login;
