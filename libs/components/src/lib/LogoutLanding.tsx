export function LogoutLanding() {
  return (
    <div className="flex flex-col items-center h-[640px] relative top-48">
      <h3 className="text-2xl mb-2">Has salido del sistema</h3>
      <p className=" mb-4">Tu sesión ha finalizado correctamente</p>
      <div>
        <a href="/">
          <button className="btn">Continuar</button>
        </a>
      </div>
    </div>
  );
}
