# Containerising the Node App

To containerise the node app the following actions are written in the Dockerfile
- ``FROM node``: specify the official node Docker container to build from
- ``WORKDIR /usr/src/app``: create app directory and set to working directory
- ``COPY app/ .`` copy local app folder to container
- ``RUN npm install`` run npm install to install all necessary dependencies
- ``EXPOSE 3000`` expose 3000 for app to run correctly
- ``CMD ["npm", "start", "app.js;"]`` final command to start the app

**Dockerfile**
```
FROM node

LABEL MAINTAINER=lwaltmann@spartaglobal.com

# Create app directory
WORKDIR /usr/src/app

COPY app/ .

RUN npm install

EXPOSE 3000

CMD ["npm", "start", "app.js;"]
```

- The image can then be built by changing to the directory containing the Dockerfile and running the following commands:
```
docker build -t ldaijiw/eng74_nodeapp .
```
- And running the container with
```
docker run -d -p 80:3000 ldaijiw/eng74_nodeapp
```
- typing in ``localhost`` in browser should then show the home page of the app
- after creating the DockerHub repository: ``eng74_nodeapp``, commit and push the working image to DockerHub with
```
docker commit <container_id> ldaijiw/eng74_nodeapp
docker push ldaijiw/eng74_nodeapp
```
The docker image can then be downloaded and run from any machine by specifying the image name: ``ldaijiw/eng74_nodeapp``
