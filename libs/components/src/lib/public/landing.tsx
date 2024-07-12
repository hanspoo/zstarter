import { Link } from 'react-router-dom';

export function LandingHome() {
  return (
    <div className="hero my-20 mx-0">
      <div className="hero-content text-left">
        <div className="max-w-md">
          <h1 className="text-4xl font-bold">New Article</h1>
          <p className="py-6">
            We’re always looking for new guest authors and we welcome individual
            bloggers to contribute high-quality guest posts to our web site.
          </p>

          <Link className="mb-6 btn btn-primary" to="/article">
            Start
          </Link>

          <div className="mb-2 font-thin text-sm">
            By submitting an article, you agree to us using it on our website
            (with any amends we deem suitable) and you will not claim for
            payment or copyright infringement now or in the future.
          </div>
        </div>
      </div>
    </div>
  );
}
