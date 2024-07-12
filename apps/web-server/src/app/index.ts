import dotenv from 'dotenv';
dotenv.config();
import axios from 'axios';
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
import { ZitadelIntrospectionResponse } from './ZitadelIntrospectionResponse';
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

// app.use((req: Request, res: Response, next: NextFunction) => {
//   console.log(req.url);

//   next();
// });
app.use(express.json());
app.use(express.static('../front'));
const authMiddleware = async function (
  req: ReqWithSession,
  res: Response,
  next: NextFunction
) {
  const authorization = req.headers['authorization'];
  if (authorization) {
    const [, token] = authorization.trim().split(/ /);
    console.log(token);
    if (token) {
      return next();
    } else {
      return res.sendStatus(401);
    }
  } else {
    console.log('Petición sin token: ' + req.url);
    return res.sendStatus(401);
  }
};

// const debugMiddleware = async function (
//   req: ReqWithSession,
//   res: Response,
//   next: NextFunction
// ) {
//   const authorization = req.headers['authorization'];
//   console.log({ authorization, url: req.url });
//   next();
// };

// app.use(debugMiddleware);

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

// function authorized(request, response, next) {
//   passport.authenticate(
//     'zitadel-introspection',
//     { session: false },
//     async (error, token) => {
//       if (error || !token) {
//         console.log({ error });
//         response.status(401).json({ message: 'Unauthorized Message' });
//       }
//       try {
//         console.log('token', token);
//         //const user = await User.findOne({ _id: token._id });
//         //request.user = user;
//       } catch (error) {
//         next(error);
//       }
//       next();
//     }
//   )(request, response, next);
// }

//app.use('/api/articles', authorized);
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

    //if (!postgresDataSource.isInitialized) await postgresDataSource.initialize();
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

// app.use(
//   '/api/admin/articles',
//   passport.authenticate('zitadel-introspection', { session: false })
// );

app.get('/api/admin/articles', customMiddleware, async (req, res) => {
  const articles = await new ArticlesFinder(req['org']).findAll();

  res.status(200).send(articles);
});

export { app };
