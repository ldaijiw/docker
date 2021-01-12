FROM node

LABEL MAINTAINER=lwaltmann@spartaglobal.com

# Create app directory
WORKDIR /usr/src/app

COPY app/ .

RUN npm install

EXPOSE 3000

CMD ["npm", "start", "app.js;"]
