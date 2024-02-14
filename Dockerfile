FROM node:18.17.0-alpine as base 

FROM base as deps
RUN apk add --no-cache libc6-compat
WORKDIR /app

COPY package.json tsconfig.json pnpm-lock.yaml ./

RUN corepack enable

RUN --mount=type=cache,id=pnpm,target=/pnpm/store \
    npm install -g pnpm && \
    pnpm i


FROM base as builder 
WORKDIR /app 
COPY . .

RUN corepack enable

RUN pnpm i
RUN pnpm build

USER node 

EXPOSE 3000

CMD ["pnpm", "start"]
