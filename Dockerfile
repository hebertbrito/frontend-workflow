FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
 
FROM nginx
#elasticbeanstalk find by port 80, indicated for expose
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html