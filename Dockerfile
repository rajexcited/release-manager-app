FROM node:24-slim

WORKDIR /usr/app/release-manager-app

EXPOSE 3000
ENV PORT=3000
ENV HOST=0.0.0.0

COPY package.json package-lock.json ./
RUN npm ci --production
RUN npm cache clean --force
ENV NODE_ENV="production"

COPY tsconfig.json ./
COPY src ./src
COPY build ./build

CMD [ "npm", "start" ]
