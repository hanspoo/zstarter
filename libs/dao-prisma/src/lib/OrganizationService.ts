import { Organization } from '@freedom/api-interfaces';
import { PrismaOrganization, PrismaClient } from '@prisma/client';

export class OrganizationService {
  async findByHostName(host: string): Promise<Organization | null> {
    const prismaOrg = await this.findPrismaOrgByHostName(host);

    if (prismaOrg === null) {
      throw Error(`No organization found for hostname ${host}`);
    }

    return prismaToModel(prismaOrg);
  }
  async findPrismaOrgByHostName(
    host: string
  ): Promise<PrismaOrganization | null> {
    const prisma = new PrismaClient();

    return await prisma.prismaOrganization.findFirst({
      where: {
        host,
      },
    });
  }
}

function prismaToModel(dao: PrismaOrganization): Organization {
  const d: Organization = {
    id: dao.id,
    name: dao.name,
    theme: dao.theme,
    callbackUrl: '',
    host: '',
  };
  return d;
}
