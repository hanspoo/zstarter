import React, { useEffect } from 'react';
import { RootState } from '@freedom/redux-store';
import { useDispatch, useSelector } from 'react-redux';
import { fetchOrg } from '@freedom/redux-store';
import { Centered } from './utils/Centered';

export function OrgProvider({ children }: React.PropsWithChildren) {
  const dispatch = useDispatch();
  const { status, org } = useSelector((state: RootState) => state.config);

  console.log({ status });
  useEffect(() => {
    if (status === 'idle') {
      dispatch(fetchOrg() as any);
    }
  }, []);

  if (status === 'rejected')
    return <Centered>Error al cargar página (1)</Centered>;
  if (status === 'pending') return null;
  if (status === 'idle') return null;
  if (!org) return <Centered>Error interno, no hay organización</Centered>;

  return <div data-theme={org.theme}>{children}</div>;
}
