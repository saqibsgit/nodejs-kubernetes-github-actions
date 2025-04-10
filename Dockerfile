# this is dockerfile for node.js application

# use Node.js 18 base image
FROM node:18

#Create and set the working directory
WORKDIR /usr/src/app

# Copy only the app-specific files first (for better layer caching)
COPY app/package.json ./
RUN npm install

# Now copy the rest of the app code
COPY app ./

# Expose the port the app runs on
EXPOSE 3000

# run the application
CMD ["npm", "start"]

