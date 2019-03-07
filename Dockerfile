# base image
FROM node:10.15.2

# install chrome for protractor tests
#@q Is this useful ?? required ?? 190307
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update && apt-get install -yq google-chrome-stable

# set working directory
RUN mkdir /usr/src/app
WORKDIR /usr/src/app

# add `/usr/src/app/node_modules/.bin` to $PATH
ENV PATH /usr/src/app/node_modules/.bin:$PATH

# Some install 

RUN npm i npm --g 
RUN npm i gyp --g
RUN npm i yarn --g


#RUN npm install -g @angular/cli @angular-devkit/build-angular
RUN npm install -g @pattern-lab/cli


