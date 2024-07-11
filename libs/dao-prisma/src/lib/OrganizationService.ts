import { Organization } from '@freedom/api-interfaces';
import { PrismaOrganization } from '@prisma/client';
import { prismaAccess } from './PrismaAccess';

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
    return await prismaAccess.prismaOrganization.findFirst({
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
    host: dao.host,
    clientId: dao.clientId,
  };
  return d;
}
