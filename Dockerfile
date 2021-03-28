FROM node:lts-alpine

# install simple http server for serving static content
RUN npm install -g http-server @vue/cli @vue/cli-service

# make the 'app' folder the current working directory
WORKDIR /app

# copy both 'package.json' and 'package-lock.json' (if available)
COPY package*.json ./

# install project dependencies
RUN npm install

# copy project files and folders to the current working directory (i.e. 'app' folder)
# all except those starting on "package" (package.json & package-lock.json)
COPY [^package]* .

# build app for production with minification
RUN npm run build

EXPOSE 8080
CMD [ "http-server", "dist" ]

