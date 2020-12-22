# Openshift version
FROM node:alpine
MAINTAINER Marco Antonioni <antonioni.marco@gmail.com>

ENV PB_FOLDER=/opt/hastebin
WORKDIR ${PB_FOLDER}
ADD . ${PB_FOLDER}/
RUN npm install
VOLUME ["${PB_FOLDER}"]
RUN chown -R 1001:0 ${PB_FOLDER}

RUN ls -al / && run ls -al ${PB_FOLDER}

USER 1001
EXPOSE 7777
CMD ["npm", "start"]
