FROM node:14 as build

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . ./

FROM node:14-alpine 

WORKDIR /app

COPY --from=build /app .

EXPOSE 3000

CMD ["node", "app.js"]
