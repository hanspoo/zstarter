import { Navbar } from './navbar';
import { Footer } from './footer';

export function Layout({ children }: React.PropsWithChildren) {
  return (
    <div className="flex h-screen flex-col justify-between">
      <div>
        <Navbar />
        <main>{children}</main>
      </div>
      <Footer />
    </div>
  );
}
