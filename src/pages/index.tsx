import type { NextPage } from 'next'
import Head from 'next/head'
import styles from '../styles/Home.module.css'

const Home: NextPage = () => {
  return (
    <div className={styles.container}>
      <Head>
        <title>Mi Aplicación Next.js</title>
        <meta name="description" content="Aplicación Next.js con Docker" />
        <link rel="icon" href="/favicon.ico" />
      </Head>

      <main className={styles.main}>
        <h1 className={styles.title}>
          ¡Bienvenido a{' '}
          <a href="https://nextjs.org">Next.js</a> con Docker!
        </h1>

        <p className={styles.description}>
          Tu aplicación está funcionando correctamente 🚀
        </p>

        <div className={styles.grid}>
          <div className={styles.card}>
            <h2>Documentación &rarr;</h2>
            <p>Encuentra información detallada sobre las características y API de Next.js.</p>
          </div>

          <div className={styles.card}>
            <h2>Aprender &rarr;</h2>
            <p>¡Aprende sobre Next.js en un curso interactivo con cuestionarios!</p>
          </div>

          <div className={styles.card}>
            <h2>Ejemplos &rarr;</h2>
            <p>Descubre y despliega proyectos de ejemplo de Next.js.</p>
          </div>

          <div className={styles.card}>
            <h2>Desplegar &rarr;</h2>
            <p>
              Despliega instantáneamente tu aplicación Next.js en Vercel.
            </p>
          </div>
        </div>
      </main>

      <footer className={styles.footer}>
        <a
          href="https://vercel.com?utm_source=create-next-app&utm_medium=default-template&utm_campaign=create-next-app"
          target="_blank"
          rel="noopener noreferrer"
        >
          Powered by{' '}
          <span className={styles.logo}>
            <img src="/vercel.svg" alt="Vercel Logo" width={72} height={16} />
          </span>
        </a>
      </footer>
    </div>
  )
}

export default Home
