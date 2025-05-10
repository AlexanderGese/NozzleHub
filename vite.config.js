import { defineConfig } from 'vite'

export default defineConfig({
  preview: {
    allowedHosts: ['all','nozzlehub.cloudcircut.tech'],
    host: true,
    port: 4321
  }
  preview.allowedHosts: ['nozzlehub.cloudcircut.tech']
})
