import { combineSlices, configureStore } from '@reduxjs/toolkit';

import { configSlice } from '../features/cart/configSlice';
import { authSlice } from '../features/cart/authSlice';

// `combineSlices` automatically combines the reducers using
// their `reducerPath`s, therefore we no longer need to call `combineReducers`.
const rootReducer = combineSlices(configSlice, authSlice);
// ...

export const makeStore = () => {
  return configureStore({
    reducer: rootReducer,
  });
};

export type AppStore = ReturnType<typeof makeStore>;
// Infer the `RootState` and `AppDispatch` types from the store itself
export type RootState = ReturnType<AppStore['getState']>;
export type AppDispatch = AppStore['dispatch'];
