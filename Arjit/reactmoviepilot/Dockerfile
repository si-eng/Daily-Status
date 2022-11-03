# pull the official base image
FROM node:14
# set working direction
WORKDIR /app
# add `/app/node_modules/.bin` to $PATH
#ENV PATH /app/node_modules/.bin:$PATH
# install application dependencies
COPY package.json ./
COPY package-lock.json ./
RUN npm i

# add app
COPY . ./
RUN npm run build && cd build
EXPOSE 3000
# start app
CMD ["npm", "start", "0.0.0.0:3000"]