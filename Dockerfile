FROM centos:centos7

RUN yum install -y epel-release
RUN yum install -y nodejs npm

COPY src/* /src/

RUN cd /src ; npm install --production
RUN npm install ip

EXPOSE 8080
cmd ["node", "/src/index.js"]
