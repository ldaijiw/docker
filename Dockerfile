# build image from official image of nginx
FROM nginx

# Label used as reference, maintainer to add info for who built image
LABEL MAINTAINER=lwaltmann@spartaglobal.com

# copy customised index.html file
COPY index.html /usr/share/nginx/html/index.html

# expose port 80 to launch in browser
EXPOSE 80

# CMD will run this command once all other instructions have been successfully completed
CMD ["nginx", "-g", "daemon off;"]
