FROM node:20.3.0-alpine3.17
RUN mkdir project
RUN cd project
WORKDIR /project
COPY . /project
RUN npm install
EXPOSE 8000
CMD ["node","app.js"]
