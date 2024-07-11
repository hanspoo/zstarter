import React from 'react';
import useSWR from 'swr';

import { Loading } from './utils/loading';
import { OrgContext } from './contexts/OrgContext';
import { Organization } from '@freedom/api-interfaces';
import { fetcher } from './fetcher';
import { Centered } from './utils/Centered';

export function OrgProvider({ children }: React.PropsWithChildren) {
  const { data, error, isLoading } = useSWR('/api/org-info', fetcher);

  if (isLoading) return <Loading />;
  if (error) return <Centered>{error.message}</Centered>;

  return (
    <OrgContext.Provider
      value={{ org: data as Organization, theme: data.theme }}
    >
      <div data-theme={data.theme}>{children}</div>
    </OrgContext.Provider>
  );
}
