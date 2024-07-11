export interface ZitadelUser {
  id_token: string;
  session_state: null;
  access_token: string;
  token_type: string;
  scope: string;
  profile: Profile;
  expires_at: number;
}

interface Profile {
  iss: string;
  sub: string;
  aud: string[];
  exp: number;
  iat: number;
  client_id: string;
  name: string;
  given_name: string;
  family_name: string;
  locale: string;
  updated_at: number;
  preferred_username: string;
  email: string;
  email_verified: boolean;
}
