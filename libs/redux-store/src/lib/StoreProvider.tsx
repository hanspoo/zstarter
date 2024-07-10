'use client';
import { useRef } from 'react';
import { Provider } from 'react-redux';

import React from 'react';
import { AppStore, makeStore } from './app/store';

export function StoreProvider({ children }: { children: React.ReactNode }) {
  const storeRef = useRef<AppStore>();
  if (!storeRef.current) {
    storeRef.current = makeStore();
  }

  return <Provider store={storeRef.current}>{children}</Provider>;
}
