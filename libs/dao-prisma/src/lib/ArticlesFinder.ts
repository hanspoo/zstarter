import { Article } from '@freedom/api-interfaces';
import { PrismaArticle, PrismaClient } from '@prisma/client';

export class ArticlesFinder {
  async findAll(): Promise<Article[]> {
    const prisma = new PrismaClient();

    const articles = await prisma.prismaArticle.findMany();
    return articles.map((d) => prismaToModel(d));
  }
}

function prismaToModel(dao: PrismaArticle): Article {
  const d: Article = {
    phone: dao.phone,
    coments: dao.coments,
    name: dao.name,
    email: dao.email,
  };
  return d;
}
