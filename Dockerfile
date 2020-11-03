# docker file for production
# 여기 FROM 부터 다음 FROM 전까지는 모두 builder stage라는 것을 명시
FROM node:alpine as builder

WORKDIR /usr/src/app

COPY package.json ./

RUN npm install

COPY ./ ./

RUN npm run build

# nginx
FROM nginx

COPY --from=builder /usr/src/app/build /usr/share/nginx/html

