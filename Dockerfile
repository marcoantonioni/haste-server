# Openshift version

# accesso a registry docker.io/library
# FROM node:alpine

# accesso a IS in NS, eseguire podman push da locale a NS progetto
# es: sudo podman push default-route-openshift-image-registry.apps.qb-testpaks.cp.fyre.ibm.com/test-haste-server/node:marco
FROM node:marco
MAINTAINER Marco Antonioni <antonioni.marco@gmail.com>

ENV PB_FOLDER=/opt/hastebin
WORKDIR ${PB_FOLDER}

# copia sorgenti e configurazioni
ADD . ${PB_FOLDER}/

# installa dipendenze
RUN npm install

# ownership utnte non-root
RUN chown -R 1001:0 /opt/hastebin && chmod -R ug+rwx /opt/hastebin

# imposta volume
VOLUME ["${PB_FOLDER}"]

# utente
USER 1001

# porta (vedi configurazione in )
EXPOSE 7777

# avvio
CMD ["npm", "start"]
