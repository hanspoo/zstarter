import { Article } from '@freedom/api-interfaces';

export function CorreoArticlente({ article }: { article: Article }) {
  return (
    <>
      <p>Hola {article.name}</p>
      <p>Hemos recibido tu article</p>
      <p>El detalle es el siguiente:</p>

      <p>{article.name}</p>
      <p>{article.email}</p>
      <p>{article.coments}</p>
      <p>{article.phone}</p>

      <p>Tomaremos las acciones para atenderla...</p>
      <p>
        Gracias,
        <br />
        Atte, Recursos Humanos Stargate
      </p>
    </>
  );
}
