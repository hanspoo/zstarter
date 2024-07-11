import { Article } from '@freedom/api-interfaces';
import { EmailArticlente } from './EmailArticlente';

export class ArticleMailerService {
  constructor(public article: Article) {}

  async notificarComprador() {
    const service = new EmailArticlente(this.article);
    service.send();
  }
}
