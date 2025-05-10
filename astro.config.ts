import { defineConfig } from 'astro/config';
import sitemap from '@astrojs/sitemap';
import UnoCSS from 'unocss/astro';

import vercel from '@astrojs/vercel';

export default defineConfig({
  site: 'http://localhost:3000',
  trailingSlash: 'ignore',
  integrations: [sitemap(), UnoCSS({ injectReset: true })],

  vite: {
    optimizeDeps: {
      exclude: ['@resvg/resvg-js'],
    },
  },

  adapter: vercel(),
});