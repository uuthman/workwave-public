# Stage 1: Build Stage
FROM node:14-slim AS build

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install the application's dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the application
RUN npm run build

# Stage 2: Production Stage
FROM nginx:alpine

# Copy build files to Nginx
COPY --from=build /app/build /usr/share/nginx/html

# Exposing the port the app runs on
EXPOSE 80

# Start the application
# New Dummy change to create a new pull request and test the release drafter
#dummy changes just to create a new pull request
CMD ["nginx", "-g", "daemon off;"]

#dummy change I made for the feature/release branch.
# More changes to test the feature/release branch into develop branch.

### Further CHANGES!!!