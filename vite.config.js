import { defineConfig } from 'vite'

export default defineConfig({
  preview: {
    allowedHosts: ['all','nozzlehub.cloudcircut.tech'],
    host: true,
    port: 4321
  }
})
