# Openshift version

# accesso a registry docker.io/library
# FROM node:alpine

# accesso a IS in NS, eseguire podman push da locale a NS progetto
# es: sudo podman push default-route-openshift-image-registry.apps.qb-testpaks.cp.fyre.ibm.com/test-haste-server/node:marco
FROM node:marco
MAINTAINER Marco Antonioni <antonioni.marco@gmail.com>

ENV PB_FOLDER=/opt/hastebin
WORKDIR ${PB_FOLDER}
ADD . ${PB_FOLDER}/
RUN npm install
VOLUME ["${PB_FOLDER}"]
RUN chown -R 1001:0 ${PB_FOLDER}/*

RUN ls -al / && echo PB_FOLDER=${PB_FOLDER} && ls -al ${PB_FOLDER}

USER 1001
EXPOSE 7777
CMD ["npm", "start"]
