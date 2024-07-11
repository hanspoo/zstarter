import { Formik, Form, Field, useField } from 'formik';
import { useState } from 'react';
import { Alert } from 'react-daisyui';
import axios from 'axios';
import * as Yup from 'yup';
import { Loading } from '../utils/loading';
import { Article, CrearArticleRequest } from '@freedom/api-interfaces';

const MyTextArea = (props: any) => {
  const [field, meta] = useField(props);
  return <textarea {...field} {...props} />;
};

const ArticleSchema = Yup.object().shape({
  name: Yup.string()
    .min(2, 'Muy corto')
    .max(50, 'Muy largo')
    .required('Requerido'),
  email: Yup.string().email('Email inválido').required('Requerido'),
  phone: Yup.string()
    .min(7, 'Muy corto')
    .max(12, 'Muy largo')
    .required('Requerido'),
  coments: Yup.string(),
});

// eslint-disable-next-line @typescript-eslint/ban-types
type Props = {};

const MILIS = 5000;
export const FormArticle = () => {
  const [enviando, setEnviando] = useState(false);
  // const { Dialog, handleShow } = Modal.useDialog();
  const [article, setArticle] = useState<Article>();
  const [error, setError] = useState('');

  function submitForm(values: {
    name: string;
    coments: string;
    phone: string;
    email: string;
  }) {
    setEnviando(true);
    // handleShow();
    const req: CrearArticleRequest = values;
    axios
      .post('/api/articles', req)
      .then((response) => {
        setTimeout(() => setArticle(response.data), MILIS);
        // handleShow();
      })
      .catch((error) => {
        setTimeout(() => {
          setError(error.message);
          // setEnviando(false);
        }, MILIS);
        // handleShow();
      });
  }

  if (article)
    return (
      <div className="hero my-20 mb-60">
        <div className="hero-content text-center">
          <div className="max-w-md">
            <h1 className="text-3xl font-bold">Article ingresada</h1>
            <p className="py-6">
              Estimado {article.name}, hemos ingresado tu article con el # xxxxx
            </p>
            <button className="btn btn-primary">Revisar pasos a seguir</button>
          </div>
        </div>
      </div>
    );

  return (
    <div className="my-10 px-2 max-w-screen-lg m-auto">
      <h1 className="my-2 mb-4 font-bold text-2xl">Ingresar Article</h1>

      <Formik
        initialValues={{
          name: '',
          coments: '',
          phone: '',
          email: '',
        }}
        validationSchema={ArticleSchema}
        onSubmit={(values) => {
          submitForm(values);
          console.log({ values });
        }}
      >
        {({ errors, touched }) => (
          <Form className="flex flex-col">
            <div className="mb-6">
              Completa la información y presiona Enviar. Se enviará un correo de
              confirmación con los datos de la article.
            </div>
            {enviando &&
              (error ? (
                <ErrorEnviar
                  error={error}
                  cerrar={() => {
                    setError('');
                    setEnviando(false);
                  }}
                />
              ) : (
                <Enviando />
              ))}
            <div className="form-control mb-2">
              <label className="label">
                <span className="label-text">Nombre</span>

                {errors.name && touched.name ? (
                  <span className="text-red-200 label-text-alt">
                    {errors.name}
                  </span>
                ) : null}
              </label>
              <Field
                disabled={enviando}
                name="name"
                className="input input-bordered"
              />
            </div>

            <div className="form-control mb-2">
              <label className="label">
                <span className="label-text">Email</span>

                {errors.email && touched.email ? (
                  <span className="text-red-200 label-text-alt">
                    {errors.email}
                  </span>
                ) : null}
              </label>
              <Field
                name="email"
                className="input input-bordered"
                disabled={enviando}
              />
            </div>

            <div className="form-control mb-2">
              <label className="label">
                <span className="label-text">Teléfono</span>

                {errors.phone && touched.phone ? (
                  <span className="text-red-200 label-text-alt">
                    {errors.email}
                  </span>
                ) : null}
              </label>
              <Field
                name="phone"
                className="input input-bordered"
                disabled={enviando}
              />
            </div>

            <div className="form-control mb-8">
              <label className="label">
                <span className="label-text">Información adicional</span>

                {errors.coments && touched.coments ? (
                  <span className="text-red-200 label-text-alt">
                    {errors.coments}
                  </span>
                ) : null}
              </label>
              <MyTextArea
                name="coments"
                className="textarea textarea-bordered"
                rows={4}
                disabled={enviando}
              />
            </div>

            <button
              disabled={enviando}
              className="btn btn-primary"
              type="submit"
            >
              Enviar
            </button>
          </Form>
        )}
      </Formik>
    </div>
  );
};

function Enviando() {
  return (
    <Alert className="my-2 border-2 rounded-md p-4 bg-sky-100">
      <p className="mb-4">Se está enviando el formulario, espere un momento.</p>
      <Loading />
    </Alert>
  );
}

type ErrorEnviarProps = {
  error: string;
  cerrar: () => void;
};
function ErrorEnviar({ error, cerrar }: ErrorEnviarProps) {
  return (
    <Alert className="my-2 border-2 rounded-md p-4 bg-red-100">
      <p className="mb-1 font-bold">
        Ha ocurrido un error al enviar el formulario:
      </p>
      <p className="mb-4">{error}</p>
      <button type="button" onClick={cerrar} className="btn btn-primary">
        Volver
      </button>
    </Alert>
  );
}
