ARG base=debian:bookworm
From ${base}
ARG base

ARG ver_node=18

RUN apt update; apt install -y git make curl gnupg2 bash-completion screen vim
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | apt-key add - ;\
    echo "deb https://deb.nodesource.com/node_${ver_node}.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list; \
    apt update

RUN apt install -y build-essential; \
    apt install -y nodejs -t nodistro; \
    npm install -g npm; \
    npm install -g --unsafe-perm node-red; \
    npm install -g openapi-red \
                   node-red-nodegen node-red-contrib-web-of-things node-red-contrib-wot-discovery \
                   node-red-contrib-noble-bluetooth \
                   openapi-red

EXPOSE 1880
CMD node-red
