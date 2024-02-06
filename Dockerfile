ARG base=debian:bookworm
From ${base}
ARG base

ARG ver_node=18

RUN apt update; apt install -y git make curl gnupg2 bash-completion screen vim
RUN curl -fsSL https://deb.nodesource.com/setup_${ver_node}.x | bash -

RUN apt install -y build-essential nodejs; \
    npm install -g npm; \
    npm install -g --unsafe-perm node-red; \
    npm install -g openapi-red ;\
    npm install -g node-red-nodegen ;\
    npm install -g node-red-contrib-web-of-things ;\
    npm install -g node-red-contrib-wot-discovery ;\
    npm install -g node-red-contrib-noble-bluetooth

EXPOSE 1880
CMD node-red
