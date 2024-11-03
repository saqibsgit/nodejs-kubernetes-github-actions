# this is dockerfile for node.js application

# use Node.js 18 base image
FROM node:18

#Create and set the working directory
WORKDIR /usr/scr/app

# copy package.json and install dependencies
COPY package.json ./app
RUN npm install

# copy the rest of application code
COPY . .

# Expose port
EXPOSE 3000

# run the application
CMD ["npm", "start"]

