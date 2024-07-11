import { Organization } from '@freedom/api-interfaces';
import { PayloadAction, createAsyncThunk, createSlice } from '@reduxjs/toolkit';
import { RestStatus } from './RestStatus.1';

type StateType = {
  user?: Organization;
  authenticated: boolean | null;
  status: RestStatus;
};

const INITIAL: StateType = {
  user: undefined,
  authenticated: false,
  status: 'idle',
};

//Reducer
export const authSlice = createSlice({
  name: 'auth',
  initialState: INITIAL,
  reducers: {
    setAuthenticated: (state, action: PayloadAction<boolean | null>) => {
      return { ...state, authenticated: action.payload };
    },
    setUser: (state, action: PayloadAction<any>) => {
      return { ...state, authenticated: action.payload };
    },
  },
});

export const { setAuthenticated } = authSlice.actions;

export default authSlice.reducer;
