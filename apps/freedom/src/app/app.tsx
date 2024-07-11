import { Footer, Navbar } from '@freedom/components';
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import { AdminHome } from './AdminHome';
import RealApp from './real-app';

export function App() {
  return (
    <BrowserRouter>
      <div className="h-screen w-full m-auto max-w-[1280px] flex flex-col justify-between items-center">
        <div className="w-full">
          <Navbar />
          <Routes>
            <Route path="/" element={<PublicLanding />}></Route>
            <Route path="/admin" element={<RealApp />} />
          </Routes>
        </div>
        <Footer />
      </div>
    </BrowserRouter>
  );
}

function PublicLanding() {
  return (
    <div>
      <h1 className="text-2xl my-4 font-bold">Canal de denuncias</h1>
    </div>
  );
}
