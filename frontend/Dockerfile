FROM node:20-alpine AS builder

WORKDIR /app

# Install Angular CLI 16
RUN npm install -g @angular/cli@16

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm i

COPY . .

# For Angular 16, use configuration flag instead of --prod
RUN ng build --configuration=production

FROM nginx:alpine

COPY --from=builder /app/dist/frontend /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]