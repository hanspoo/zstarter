import { Organization } from '@freedom/api-interfaces';
import { PayloadAction, createAsyncThunk, createSlice } from '@reduxjs/toolkit';
import { RestStatus } from './RestStatus.1';

export const fetchOrg = createAsyncThunk('api/org-info', () => {
  return fetch('/api/org-info').then((r) => r.json());
});
type StateType = {
  org?: Organization;
  theme: string;
  status: RestStatus;
};

const INITIAL: StateType = {
  org: undefined,
  theme: 'business',
  status: 'idle',
};

//Reducer
export const configSlice = createSlice({
  name: 'config',
  initialState: INITIAL,
  reducers: {
    setTheme: (state, action: PayloadAction<string>) => {
      return { ...state, theme: action.payload };
    },
  },
  extraReducers: (builder) => {
    builder
      //fetchShoppingOrganization
      .addCase(fetchOrg.pending, (state) => {
        state.status = 'pending';
      })
      .addCase(
        fetchOrg.fulfilled,
        (state, action: PayloadAction<Organization>) => {
          state.status = 'fulfilled';
          state.org = action.payload;
        }
      )
      .addCase(fetchOrg.rejected, (state, action) => {
        console.log({ errorPayload: action.payload });
        state.status = 'rejected';
      });
  },
});

export const { setTheme } = configSlice.actions;

export default configSlice.reducer;
