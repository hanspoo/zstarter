import { useAuth } from 'react-oidc-context';

export function PleaseLogin() {
  const auth = useAuth();
  return (
    <div className="hero min-h-[640px]">
      <div className="hero-content text-center">
        <div className="max-w-md">
          <h1 className="text-3xl font-bold">Iniciar sesión</h1>
          <p className="py-6">
            Por favor ingrese sus credenciales y presione el botón
          </p>
          <button
            className="btn btn-primary"
            onClick={() => void auth.signinRedirect()}
          >
            Log in
          </button>
        </div>
      </div>
    </div>
  );
}
