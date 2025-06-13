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
      title: 'Manideep Chittineni',
      meta: [
        { charset: 'utf-8' },
        { name: 'viewport', content: 'width=device-width, initial-scale=1' },
        {
          name: 'description',
          content:
            'Specialized in enterprise-scale migrations and optimizing cloud infrastructure for maximum performance and cost efficiency.',
        },
      ],
      link: [{ rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }],
    },
  },
})
