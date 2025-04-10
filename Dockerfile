# Dockerfile
FROM node:16-alpine as builder
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

FROM nginx:alpine
COPY --from=builder /app/dist/jenkins-k8s /usr/share/nginx/html
EXPOSE 80

