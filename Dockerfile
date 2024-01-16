FROM node:21-alpine AS build

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install --production

# EXPOSE 3030

FROM node:21-alpine AS runtime

WORKDIR /usr/src/app

COPY --from=build /usr/src/app .
COPY . .

EXPOSE 3030

CMD ["npm", "start"]
