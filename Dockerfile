ARG base=debian:bullseye
From ${base}
ARG base

RUN apt update; apt install -y git make curl gnupg2 bash-completion screen 
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
RUN apt install -y nodejs build-essential
RUN npm install -g npm
RUN npm install -g --unsafe-perm node-red
RUN npm install -g node-red-nodegen node-red-contrib-web-of-things node-red-contrib-wot-discovery

# RUN (cd /opt; git clone https://github.com/k-toumura/node-red-nodegen.git -b webofthings; cd /opt/node-red-nodegen; npm install -g )
# RUN (cd /opt; git clone https://github.com/node-red/node-red-nodegen.git;                 cd /opt/node-red-nodegen; npm install -g )

CMD node-red
