FROM node:20-alpine

WORKDIR /src/app
COPY . .
RUN npm install
RUN npm build

FROM node:20-alpine

WORKDIR /src/app
COPY --from=stage /src/app/dist ./dist
CMD [ "node", "dist/main.js" ]