import { FormArticle, LandingHome } from '@freedom/components';
import { Routes, Route, Outlet, Link } from 'react-router-dom';

export function Unauthenticated() {
  return (
    <Routes>
      <Route path="/" element={<LandingHome />}></Route>
      <Route path="/article" element={<FormArticle />} />
    </Routes>
  );
}
