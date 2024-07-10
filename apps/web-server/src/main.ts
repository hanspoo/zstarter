import * as dotenv from 'dotenv';
dotenv.config();

import { app } from './app';

async function f() {
  const port = process.env['PORT'] || 3333;
  const server = app.listen(port, () => {
    console.log('Listening at http://localhost:' + port + '/api');
  });
  server.on('error', console.error);
}

f();
