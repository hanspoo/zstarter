import { PrismaClient } from '@prisma/client';

const db = process.env['NODE_ENV'] || 'dev';

let DB_URL = process.env['DATABASE_URL'];

if (!DB_URL) {
  DB_URL = `postgresql://julian:hp8270@localhost:5432/freedom-${db}`;
  process.env['DATABASE_URL'] = DB_URL;
}

console.log(DB_URL);

const prisma = new PrismaClient();

export async function daoPrisma() {
  await prisma.article.deleteMany();
  const article = await prisma.article.create({
    data: {
      name: 'Alice',
      email: 'alice@prisma.io',
      estado: 'abc',
      coments: 'abc',
      phone: '123',
    },
  });
  return article;
}

daoPrisma()
  .then(async () => {
    await prisma.$disconnect();
  })
  .catch(async (e) => {
    console.error(e);
    await prisma.$disconnect();
    process.exit(1);
  });
