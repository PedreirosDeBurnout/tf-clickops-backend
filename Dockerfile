FROM node:21-alpine AS build

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install

COPY src ./
COPY tsconfig.json ./
RUN npm run build

FROM node:21-alpine AS runtime

WORKDIR /usr/src/app

COPY --from=build /usr/src/app/package*.json ./
COPY --from=build /usr/src/app/dist ./dist

# Install only production dependencies
RUN npm install --production

EXPOSE 5000

CMD ["npm", "start"]
