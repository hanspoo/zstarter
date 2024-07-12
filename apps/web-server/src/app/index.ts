import dotenv from 'dotenv';
dotenv.config();

import express, { Request, Response, NextFunction } from 'express';
import cors from 'cors';
import {
  ArticlesFinder,
  OrganizationService,
  ServicioNuevasArticles,
} from '@freedom/dao-prisma';
import { CrearArticleRequest } from '@freedom/api-interfaces';
// import { ArticleMailerService } from '@freedom/services';

import passport from 'passport';
import { ZitadelIntrospectionStrategy } from 'passport-zitadel';

import { customMiddleware } from './customMiddleware';

// Register the strategy with the correct configuration.

// console.log({ zArgs });

type ReqWithSession = Request<
  unknown,
  unknown,
  { username: string; password: string }
> & {
  session: {
    user: string;
    admin: boolean;
    destroy: () => void;
  };
};

// create and setup express app
const app = express();
app.use(
  cors({
    exposedHeaders: ['*'],
    credentials: true,
  })
);
passport.use(
  new ZitadelIntrospectionStrategy({
    authority: process.env.ZITADEL_ISSUER,
    authorization: {
      type: 'basic',
      clientId: process.env.ZITADEL_API_CLIENT_ID,
      clientSecret: process.env.ZITADEL_API_SECRET,
    },
  })
);

app.use(passport.initialize());

app.use((req: Request, res: Response, next: NextFunction) => {
  console.log(req.url);

  next();
});
app.use(express.json());
app.use(express.static('../front'));

app.get('/api', (req, res) => {
  res.send({ message: 'Welcome to the api!' });
});

app.get('/api/org-info', async (req, res) => {
  const hostName = req.headers.host;
  if (!hostName) {
    throw Error('Hostname no está definido');
  }
  try {
    const org = await new OrganizationService().findByHostName(hostName);
    if (!org) throw Error(`organización ${hostName} no encontrada`);

    res.send(org);
  } catch (error) {
    return res
      .status(400)
      .send({ message: error.message || 'Error no definido' });
  }
});

app.post('/api/articles', async (req, res) => {
  const hostName = req.headers.host;
  if (!hostName) {
    throw Error('Hostname no está definido');
  }

  console.log('user ', req['user']);
  try {
    const org = await new OrganizationService().findPrismaOrgByHostName(
      hostName
    );
    if (!org) throw Error(`organización ${hostName} no encontrada`);

    const data: CrearArticleRequest = req.body;

    const servicio = new ServicioNuevasArticles(data);
    const article = await servicio.crearArticle(org);
    // const mailer = new ArticleMailerService(article);
    // await mailer.notificarComprador();
    res.status(200).send(article);
  } catch (error) {
    return res
      .status(400)
      .send({ message: error.message || 'Error no definido' });
  }
});

app.get('/api/admin/articles', customMiddleware, async (req, res) => {
  if (!req.org)
    res
      .status(400)
      .send('The organization should hava been defined by middleware');
  const articles = await new ArticlesFinder(req.org).findAll();

  res.status(200).send(articles);
});

export { app };
