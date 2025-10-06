FROM node:24-slim

WORKDIR /usr/app/release-manager-app

COPY package.json package-lock.json ./
RUN npm ci --production
RUN npm cache clean --force
ENV NODE_ENV="production"

COPY tsconfig.json ./
COPY src ./src
COPY build ./build

CMD [ "npm", "start" ]
