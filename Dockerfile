FROM node:20

RUN apt-get update
RUN apt-get install libaio1

WORKDIR /usr/src/app/lib
RUN wget https://download.oracle.com/otn_software/linux/instantclient/instantclient-basiclite-linuxx64.zip && \
    unzip instantclient-basiclite-linuxx64.zip && rm -f instantclient-basiclite-linuxx64.zip && \
    mv /usr/src/app/lib/instantclient* /usr/src/app/lib/instantclient && \
    cd /usr/src/app/lib/instantclient && rm -f *jdbc* *occi* *mysql* *README *jar uidrvci genezi adrci && \
    echo /usr/src/app/lib/instantclient > /etc/ld.so.conf.d/oracle-instantclient.conf && ldconfig

WORKDIR /usr/src/app
COPY . .
RUN npm install

CMD [ "node", "index.js" ]
