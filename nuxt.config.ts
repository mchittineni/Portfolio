// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  devtools: { enabled: true },
  target: 'static', // ✅ Static generation mode
  nitro: {
    preset: 'static', // ✅ Enable full static generation
  },
  routeRules: {
    // prerender index route
    '/': { prerender: true },
    // prerender all routes (optional: use crawler)
    '/*': { prerender: true },
  },
  modules: ['@nuxtjs/tailwindcss'],
  css: ['~/assets/css/main.css'],
  app: {
    head: {
      htmlAttrs: { lang: 'en' },
      title: 'Manideep Chittineni',
      meta: [
        { charset: 'utf-8' },
        { name: 'viewport', content: 'width=device-width, initial-scale=1' },
        { name: 'color-scheme', content: 'dark' },
        { name: 'theme-color', content: '#0a0b12' },
        {
          name: 'description',
          content:
            'Specialized in enterprise-scale migrations and optimizing cloud infrastructure for maximum performance and cost efficiency.',
        },
        // Open Graph
        { property: 'og:type', content: 'website' },
        { property: 'og:title', content: 'Manideep Chittineni' },
        {
          property: 'og:description',
          content:
            'Cloud & DevOps engineer specialized in enterprise-scale migrations and optimizing cloud infrastructure for performance and cost efficiency.',
        },
        { property: 'og:image', content: '/profile.jpg' },
        // Twitter
        { name: 'twitter:card', content: 'summary_large_image' },
        { name: 'twitter:title', content: 'Manideep Chittineni' },
        {
          name: 'twitter:description',
          content:
            'Cloud & DevOps engineer specialized in enterprise-scale migrations and optimizing cloud infrastructure for performance and cost efficiency.',
        },
        { name: 'twitter:image', content: '/profile.jpg' },
      ],
      link: [
        { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' },
        { rel: 'preconnect', href: 'https://fonts.googleapis.com' },
        { rel: 'preconnect', href: 'https://fonts.gstatic.com', crossorigin: '' },
        {
          rel: 'stylesheet',
          href: 'https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap',
        },
      ],
    },
  },
})
