# Install dependencies and build the site
FROM node:20-alpine AS builder
WORKDIR /app

# Install pnpm
RUN npm install -g pnpm

COPY . .
RUN pnpm install --frozen-lockfile
RUN pnpm build

# Serve built site using Astro's preview command
FROM node:20-alpine AS runner
WORKDIR /app

RUN npm install -g pnpm
COPY --from=builder /app /app

EXPOSE 4321

# Use preview (not dev!)
CMD ["pnpm", "preview", "--host", "--port", "4321"]
