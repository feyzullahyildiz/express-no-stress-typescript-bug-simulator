FROM node:14-alpine

COPY ./package.json ./package.json
COPY ./package-lock.json ./package-lock.json
RUN npm i
COPY . .
RUN npm run compile
CMD [ "npm", "start" ]