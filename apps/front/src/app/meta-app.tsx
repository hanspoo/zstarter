import { Footer, LandingHome, Navbar } from '@freedom/components';
import { Route, Routes } from 'react-router-dom';
import App from './app';

export function MetaApp() {
  return (
    <div className="flex h-screen flex-col justify-between">
      <div>
        <Navbar />
        <Routes>
          <Route path="/" element={<LandingHome />} />
          <Route path="/admin" element={<App />} />
        </Routes>
      </div>
      <Footer />
    </div>
  );
}
