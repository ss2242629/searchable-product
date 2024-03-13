FROM node:16.4.1 AS build
WORKDIR /app
COPY package*.json ./
RUN npm install --force
COPY . .
RUN npm run build
#RUN npm run eject
#RUN serve -s build

FROM node:16.4.1-alpine3.13
WORKDIR /app
COPY --from=build /app .
EXPOSE 3000
CMD ["npm", "start"]

