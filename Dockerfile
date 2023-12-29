FROM node:21

WORKDIR /app
COPY package*.json .
RUN npm install
RUN npm install -g serve

COPY . .

RUN npm run build

ARG REACT_APP_HOST_IP_ADDRESS
ENV REACT_APP_HOST_IP_ADDRESS $REACT_APP_HOST_IP_ADDRESS

CMD [ "serve", "-s", "build" ]

ENV PORT=3000
EXPOSE 3000
