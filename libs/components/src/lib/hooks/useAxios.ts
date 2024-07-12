import axios from 'axios';
import { useAuth } from 'react-oidc-context';

export function useAxios() {
  const auth = useAuth();
  const token = auth.user?.access_token;

  axios.defaults.headers.Authorization = `Bearer ${token}`;

  return axios;
}
