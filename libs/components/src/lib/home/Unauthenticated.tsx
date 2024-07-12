import { Routes, Route } from 'react-router-dom';
import { FormArticle } from '../form-article/form-article';
import { LandingHome } from '../public/landing';

export function Unauthenticated() {
  return (
    <Routes>
      <Route path="/" element={<LandingHome />}></Route>
      <Route path="/article" element={<FormArticle />} />
    </Routes>
  );
}
