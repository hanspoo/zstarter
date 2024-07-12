import { OrganizationService } from '@freedom/dao-prisma';
import axios from 'axios';
import { ZitadelIntrospectionResponse } from './ZitadelIntrospectionResponse';

export const customMiddleware = async (req, res, next) => {
  const hostName = req.headers.host;
  if (!hostName) {
    throw Error('Hostname no está definido');
  }

  const org = await new OrganizationService().findPrismaOrgByHostName(hostName);
  if (!org) throw Error(`organización ${hostName} no encontrada`);

  const authorization = req.headers['authorization'];
  if (authorization) {
    const [, token] = authorization.trim().split(/ /);

    const options = {
      method: 'POST',
      headers: { 'content-type': 'application/x-www-form-urlencoded' },
      data: `token=${token}`,
      url: `${process.env.ZITADEL_ISSUER}/oauth/v2/introspect`,
      auth: {
        username: org.apiUser,
        password: org.apiPassword,
      },
    };
    const response = await axios<ZitadelIntrospectionResponse>(options);
    const data = response.data;
    if (!data.active) return res.status(401).send('Inactive token');
    if (data.client_id !== org.clientId) {
      console.log(
        `client ids doesn't match: ${data.client_id} !== ${org.clientId}`
      );
      return res.status(401).send('Incorrect token');
    }

    req['org'] = org;
    next();
  } else {
    res.status(401).send('Authorization header not present');
  }
};
