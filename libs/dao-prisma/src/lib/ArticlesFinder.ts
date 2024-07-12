import { Article, Organization } from '@freedom/api-interfaces';
import { PrismaArticle } from '@prisma/client';
import { prismaAccess } from './PrismaAccess';

export class ArticlesFinder {
  constructor(public org: Organization) {}
  async findAll(): Promise<Article[]> {
    const articles = await prismaAccess.prismaArticle.findMany({
      where: {
        organizationId: this.org.id,
      },
    });
    return articles.map((d) => prismaToModel(d));
  }
}

function prismaToModel(dao: PrismaArticle): Article {
  const d: Article = {
    phone: dao.phone,
    coments: dao.coments,
    name: dao.name,
    email: dao.email,
    date: dao.createdAt.getTime(),
  };
  return d;
}
