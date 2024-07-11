import { AuthProvider } from 'react-oidc-context';
import { App } from './app';
import { useContext, useMemo } from 'react';
import { OrgContext } from '@freedom/components';

export function MetaApp() {
  const { org } = useContext(OrgContext);

  const oidcConfig = useMemo(() => {
    return {
      authority: import.meta.env.VITE_ZITADEL_SERVER || 'nada',
      client_id: org?.clientId,
      redirect_uri: `http://${org?.host}`,
      post_logout_redirect_uri: `http://${org?.host}`,
    };
  }, []);

  if (!org)
    return (
      <div className="flex flex-col mt-10 w-full items-center">
        No se ha encontrado la org
      </div>
    );
  console.log({ oidcConfig });
  return (
    <AuthProvider {...oidcConfig}>
      <App />
    </AuthProvider>
  );
}
