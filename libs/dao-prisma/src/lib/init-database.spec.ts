import { PrismaClient, PrismaOrganization, PrismaUser } from '@prisma/client';
import { hostname } from 'os';

// process.env['DATABASE_URL'] =
//   'postgresql://julian:hp8270@localhost:5432/freedom-test';
const prisma = new PrismaClient();

describe('init database', () => {
  it('crear organizacion', async () => {
    const org = await resetAndCreateOrg();
    expect(org.email).toBe('info@komplaints.cl');
    expect(org.name).toBe('Komplaints');
    expect(org.active).toBe(true);
    expect(org.phone).toBe('+569123456789');

    const orgs = await prisma.prismaOrganization.findMany();
    expect(orgs.length).toBe(1);
  });
  it('crear usuarios', async () => {
    const org = await resetAndCreateOrg();
    const user = await addUser(org);
    expect(user.email).toBe('user@komplaints.cl');
    expect(user.name).toBe('Juan Pérez');
    expect(user.active).toBe(true);
    expect(user.phone).toBe('+56997865431');

    const orgs = await prisma.prismaOrganization.findMany();
    expect(orgs.length).toBe(1);
  });
});

async function resetAndCreateOrg() {
  await cleanupDb();

  const o = {
    email: 'info@komplaints.cl',
    name: 'Komplaints',
    state: '',
    coments: null,
    phone: '+569123456789',
    active: true,
    createdAt: new Date(),
    modifiedAt: new Date(),
    host: 'main.komplaints.cl:3000',
  };
  const newOrg = await prisma.prismaOrganization.create({ data: o });
  return newOrg;
}

async function cleanupDb() {
  await prisma.prismaUser.deleteMany();
  await prisma.prismaOrganization.deleteMany();
}

async function addUser(org: PrismaOrganization) {
  const userData = {
    email: 'user@komplaints.cl',
    name: 'Juan Pérez',
    coments: null,
    phone: '+56997865431',
    active: true,
    createdAt: new Date(),
    modifiedAt: new Date(),
    organizationId: org.id,
  };

  const u = await prisma.prismaUser.create({ data: userData });

  return u;
}
