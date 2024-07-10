import Head from 'next/head';
import { Navbar } from './navbar';
import { Footer } from './footer';

export function Layout({ children }: React.PropsWithChildren) {
  return (
    <div className="flex h-screen flex-col justify-between">
      <Head>
        <title>Canal de articles</title>
        <meta name="description" content="Canal de articles" />
        <link rel="icon" href="/favicon.ico" />
      </Head>

      <div>
        <Navbar conLogin={false} />
        <main>{children}</main>
      </div>
      <Footer />
    </div>
  );
}
