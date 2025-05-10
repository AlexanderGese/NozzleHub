# Stage 1: Build
FROM node:18-alpine AS builder

# Install pnpm
RUN npm install -g pnpm

# Set working directory
WORKDIR /app

# Copy only necessary files first (for better cache)
COPY package.json pnpm-lock.yaml ./

# Install dependencies
RUN pnpm install

# Copy all source files
COPY . .

# Build the site
RUN pnpm build


# Stage 2: Run — lightweight production image
FROM node:18-alpine

# Install pnpm (required for preview)
RUN npm install -g pnpm

# Set working directory
WORKDIR /app

# Copy built files and pnpm dependencies
COPY --from=builder /app /app

# Expose the port Astro uses
EXPOSE 4321

# Run Astro preview server
CMD ["pnpm", "preview", "--host", "--port", "4321"]
