FROM node:16.15.1-alpine AS base

WORKDIR /app

COPY ["package.json", "package-lock.json", "./"]

FROM base AS dev
RUN npm ci
COPY . .
CMD [ "npm", "run", "start:dev" ]

FROM base AS prod
RUN npm ci --only=prod
COPY . .
RUN npm i -g @nestjs/cli
RUN npm run build
CMD [ "npm", "run", "start:prod" ]