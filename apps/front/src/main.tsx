import { StrictMode } from 'react';
import * as ReactDOM from 'react-dom/client';

import { BrowserRouter } from 'react-router-dom';
import { MetaApp, OrgProvider } from '@freedom/components';

const root = ReactDOM.createRoot(
  document.getElementById('root') as HTMLElement
);
root.render(
  <StrictMode>
    <BrowserRouter>
      <OrgProvider>
        <MetaApp />
      </OrgProvider>
    </BrowserRouter>
  </StrictMode>
);
