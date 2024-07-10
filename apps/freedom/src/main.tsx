import { StrictMode } from 'react';
import * as ReactDOM from 'react-dom/client';

import App from './app/app';
import { StoreProvider } from '@freedom/redux-store';
import { OrgProvider } from '@freedom/components';

const root = ReactDOM.createRoot(
  document.getElementById('root') as HTMLElement
);
root.render(
  <StrictMode>
    <StoreProvider>
      <OrgProvider>
        <App />
      </OrgProvider>
    </StoreProvider>
  </StrictMode>
);
