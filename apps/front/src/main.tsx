import { StrictMode } from 'react';
import * as ReactDOM from 'react-dom/client';
import { BrowserRouter } from 'react-router-dom';

import { MetaApp } from './app/meta-app';
import { StoreProvider } from '@freedom/redux-store';
import { OrgProvider } from '@freedom/components';

const root = ReactDOM.createRoot(
  document.getElementById('root') as HTMLElement
);
root.render(
  <StrictMode>
    <StoreProvider>
      <OrgProvider>
        <BrowserRouter>
          <MetaApp />
        </BrowserRouter>
      </OrgProvider>
    </StoreProvider>
  </StrictMode>
);
