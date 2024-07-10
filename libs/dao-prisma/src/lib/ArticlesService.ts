import {
  CrearArticleRequest,
  Article,
  Organization,
} from '@freedom/api-interfaces';
import { PrismaClient } from '@prisma/client';

export class ArticlesService {
  async crearArticle(data: CrearArticleRequest): Promise<Article> {
    const { title, intro, body, name, email } = data;

    const prisma = new PrismaClient();

    const ped = await prisma.prismaArticle.create({
      data: {
        createdAt: new Date(),

        title,
        intro,
        body,
        name,
        email,
        organizationId: this.organization.id,
      },
    });

    const articlex = await prisma.prismaArticle.findFirstOrThrow({
      where: {
        id: ped.id,
      },
      include: {
        comments: true,
      },
    });

    return articlex as any as Article;
  }
  constructor(public organization: Organization) {}
}
