import { Footer, LandingHome, Navbar } from '@freedom/components';

export function MetaApp() {
  return (
    <div className="flex h-screen flex-col justify-between">
      <div>
        <Navbar />
        <LandingHome />
      </div>
      <Footer />
    </div>
  );
}
