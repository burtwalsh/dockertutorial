FROM ubuntu:latest

#install needed software on the Docker container
RUN apt-get update -y
RUN apt-get install nodejs -y 
RUN apt-get install vim -y
RUN apt-get install npm -y
RUN apt-get install net-tools -y

RUN mkdir -p /mywebapp

#create the web application directory on the Docker container
WORKDIR /mywebapp/

#copy the application files to the Docker container
#into the WORKDIR
COPY package*.json /mywebapp/
COPY server.js /mywebapp/ 

#install the express module in our /mywebapp directory
RUN npm install express -y 

#make sure our code is executable (permissions)
RUN chmod -R 755 /mywebapp/

RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN chmod 755 /usr/bin/node

EXPOSE 3000
CMD ["npm", "start"]
