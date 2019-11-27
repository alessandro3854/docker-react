FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build

FROM nginx
EXPOSE 80
#expose espone la porta per elasticbeanstark
#a noi non fa niente ci pensa lui a cercalo
COPY --from=builder /app/build /usr/share/nginx/html