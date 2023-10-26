FROM node:20-alpine

RUN apk add --no-cache libaio libc6-compat

WORKDIR /usr/src/app/lib

WORKDIR /tmp
RUN wget https://download.oracle.com/otn_software/linux/instantclient/instantclient-basiclite-linuxx64.zip && \
    unzip instantclient-basiclite-linuxx64.zip && rm -f instantclient-basiclite-linuxx64.zip && \
    mv /tmp/instantclient* /usr/src/app/lib/instantclient && \
    cd /usr/src/app/lib/instantclient && rm -f *jdbc* *occi* *mysql* *README *jar uidrvci genezi adrci

RUN ln -s /lib/libc.so.6 /usr/lib/libresolv.so.2 && \
    ln -s /lib64/ld-linux-x86-64.so.2 /usr/lib/ld-linux-x86-64.so.2

ENV LD_LIBRARY_PATH /usr/src/app/lib/instantclient

WORKDIR /usr/src/app
COPY . .
RUN npm install

CMD [ "node", "index.js" ]
