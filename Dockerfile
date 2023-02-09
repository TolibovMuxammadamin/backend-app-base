FROM node:16.15.1-alpine

ENV NODE_ENV=production

WORKDIR /app

COPY ["package.json", "package-lock.json", "./"]

RUN npm ci --only=prod

COPY . .

RUN npm i -g @nestjs/cli
RUN npm run build

CMD [ "npm", "run", "start:prod" ]