import express, { Request, Response, NextFunction } from 'express';
import cors from 'cors';
import {
  OrganizationService,
  ServicioNuevasArticles,
} from '@freedom/dao-prisma';
import { CrearArticleRequest } from '@freedom/api-interfaces';
// import { ArticleMailerService } from '@freedom/services';

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

export { app };
