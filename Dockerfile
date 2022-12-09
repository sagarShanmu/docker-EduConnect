FROM node:alpine as teamone
WORKDIR /var/app
COPY ./package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

FROM nginx as final
EXPOSE 80
COPY --from=teamone /var/app/build /usr/share/nginx/html

CMD ["npm", "run", "start"]
