import { defineConfig } from 'vite'

export default defineConfig({
  preview: {
    allowedHosts: 'all',
    host: true,
    port: 4321
  }
})
