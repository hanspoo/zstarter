import { CrearArticleRequest, Article } from '@freedom/api-interfaces';
import { PrismaClient, PrismaOrganization } from '@prisma/client';

export class ServicioNuevasArticles {
  async crearArticle(organization: PrismaOrganization): Promise<Article> {
    const { name, phone, coments, email } = this.data;

    const prisma = new PrismaClient();

    const ped = await prisma.prismaArticle.create({
      data: {
        createdAt: new Date(),
        name,
        phone,
        coments,
        email,
        organizationId: organization.id,
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
  constructor(public data: CrearArticleRequest) {}
}
