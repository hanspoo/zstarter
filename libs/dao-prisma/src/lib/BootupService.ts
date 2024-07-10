import { PrismaClient, PrismaOrganization } from '@prisma/client';

export class BootupService {
  prisma = new PrismaClient();

  async initDatabase() {
    const n = await this.prisma.prismaOrganization.count();
    if (n > 0)
      throw Error(
        'Sólo se puede llamar a este método con la base de datos vacia'
      );

    await this.cleanupDb();
    const org = await this.resetAndCreateOrg();
    const user = await this.addUser(org);
  }

  async resetAndCreateOrg() {
    const o = {
      email: 'info@megascaffold.cl',
      name: 'Mega Scaffold',
      host: 'localhost:3000',
      state: '',
      coments: null,
      phone: '+569123456789',
      theme: 'dark',
      zitadelOrg: 'Komplaints',
      clientId: '',
      active: true,
      createdAt: new Date(),
      modifiedAt: new Date(),
    };
    const newOrg = await this.prisma.prismaOrganization.create({ data: o });
    return newOrg;
  }

  async cleanupDb() {
    await this.prisma.prismaUser.deleteMany();
    await this.prisma.prismaOrganization.deleteMany();
  }

  async addUser(org: PrismaOrganization) {
    const userData = {
      email: 'user@megascaffold.cl',
      name: 'Juan Pérez',
      coments: null,
      phone: '+56997865431',
      active: true,
      createdAt: new Date(),
      modifiedAt: new Date(),
      organizationId: org.id,
    };

    const u = await this.prisma.prismaUser.create({ data: userData });

    return u;
  }
}
