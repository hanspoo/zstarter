import { CrearArticleRequest, Article } from '@freedom/api-interfaces';
import { PrismaOrganization } from '@prisma/client';
import { prismaAccess } from './PrismaAccess';

export class ServicioNuevasArticles {
  async crearArticle(organization: PrismaOrganization): Promise<Article> {
    const { name, phone, coments, email } = this.data;

    const ped = await prismaAccess.prismaArticle.create({
      data: {
        createdAt: new Date(),
        name,
        phone,
        coments,
        email,
        organizationId: organization.id,
      },
    });

    const articlex = await prismaAccess.prismaArticle.findFirstOrThrow({
      where: {
        id: ped.id,
      },
      include: {
        comments: true,
      },
    });

    return articlex as any as Article;
  }
  constructor(public data: CrearArticleRequest) {}
}
