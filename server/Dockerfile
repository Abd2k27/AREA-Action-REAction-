FROM node:alpine

WORKDIR /server

ENV PATH node_modules/.bin:$PATH

COPY package*.json ./

RUN npm install

COPY . .

ENV PORT 8080

EXPOSE 8080

CMD ["npm", "run", "dev"]