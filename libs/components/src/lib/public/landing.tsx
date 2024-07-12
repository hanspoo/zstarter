import { Link } from 'react-router-dom';

export function LandingHome() {
  return (
    <div className="hero my-20 mx-0">
      <div className="hero-content text-left">
        <div className="max-w-md">
          <h1 className="text-4xl font-bold">Canal de Articles</h1>
          <p className="py-6">
            En este canal puedes ingresar articles en forma 100% anónima contra
            funcionarios de cualquier nivel de la organización: acoso laboral,
            ley karin, delitos financieros, nepotismo, etc, más información en:
            <a href="#"> Tipos de articles</a>.
          </p>

          <Link className="mb-6 btn btn-primary" to="/article">
            Ingresar Article
          </Link>

          <div className="mb-2 font-thin text-sm">
            Recuerda: Tu article puede ayudar a otros en la misma situación. Si
            estás muy preocupado por tu anonimato, puedes ingresar a está página
            desde una ventana privada o de incógnito de tu navegador.
          </div>
        </div>
      </div>
    </div>
  );
}