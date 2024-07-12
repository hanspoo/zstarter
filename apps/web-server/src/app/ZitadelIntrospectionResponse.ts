export interface ZitadelIntrospectionResponse {
  active: boolean;
  scope: string;
  client_id: string;
  token_type: string;
  exp: number;
  iat: number;
  auth_time: number;
  nbf: number;
  sub: string;
  aud: string[];
  amr: string[];
  iss: string;
  jti: string;
}
