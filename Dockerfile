# Stage 1: Build React app
FROM node:latest as build

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm install react-scripts@10.2.3 -g --silent

COPY . .
RUN npm run build

# Stage 2: Create lightweight image
FROM nginx:alpine

COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

