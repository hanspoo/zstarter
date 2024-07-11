import { Organization } from '@freedom/api-interfaces';
import React from 'react';

type OrgContext = {
  org?: Organization;
  theme: string;
};

export const OrgContext = React.createContext<OrgContext>({
  org: undefined,
  theme: 'bussiness',
});
