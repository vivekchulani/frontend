# Build phase (as buildPhase indicates everything under the first block can be referred to as buildPhase)
FROM node:alpine as buildPhase

WORKDIR /app

COPY package.json .
RUN npm install
COPY . .
RUN npm run build


# Run phase
FROM nginx
EXPOSE 80
COPY --from=buildPhase /app/build /usr/share/nginx/html
