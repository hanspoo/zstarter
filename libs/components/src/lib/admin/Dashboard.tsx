import useSWR from 'swr';
import { useAxios } from '../hooks/useAxios';
import { Loading } from '../utils/loading';
import { Article } from '@freedom/api-interfaces';

export function Dashboard() {
  const axios = useAxios();
  const fetcher = (url: string) => axios.get(url).then((res) => res.data);
  const { data, error, isLoading } = useSWR<Article[]>(
    '/api/admin/articles',
    fetcher
  );
  if (isLoading) return <Loading />;
  if (error) return <p>{error.message}</p>;
  if (!data) return <p>Internal error</p>;

  return (
    <div className="overflow-x-auto">
      <p className="italic text-sm mb-2">There are {data.length} articles</p>
      <table className="table table-sm bg-primary">
        <thead>
          <tr>
            <th></th>
            <th>Name</th>
            <th>Comments</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Created at</th>
          </tr>
        </thead>
        <tbody>
          {data.map((a, i) => (
            <tr>
              <th>{i}</th>
              <td>{a.name}</td>
              <td>{a.coments}</td>
              <td>{a.phone}</td>
              <td>{a.email}</td>
              <td>{new Date(a.date).toLocaleDateString()}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}
