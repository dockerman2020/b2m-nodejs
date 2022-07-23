FROM node:alpine

# Create app directory
WORKDIR /app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

#RUN npm install
RUN apk add --no-cache curl wget bash \
    && npm install
# If you are building your code for production
# RUN npm install --only=production
#================================================================================
#Add an appcheck.
ENV SYSDIG_AGENT_CONF 'app_checks: [{name: node, check_module: prometheus, pattern: {comm: node}, conf: { url: "http://localhost:3001/metrics" }}]'

# Bundle app source
COPY server.js /app

EXPOSE 3001
CMD [ "npm", "start", "server.js" ]
