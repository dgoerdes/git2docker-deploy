FROM node:boron

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Copy app source
COPY . /usr/src/app

# Install dependencies
RUN npm install -g gulp && npm install

# Build app resources
RUN gulp build

EXPOSE 3000
CMD [ "npm", "start" ]