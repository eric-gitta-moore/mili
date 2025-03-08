FROM node:8.17.0-alpine

WORKDIR /app
RUN apk add python2 git make gcc g++ curl

COPY . .
RUN git config --global url."https://".insteadOf git:// && \
    npm config set registry https://registry.npmmirror.com/ && \
    npm ci --legacy-peer-deps

EXPOSE 9906
HEALTHCHECK --interval=10s --timeout=10s --start-period=5s --retries=3 CMD [ "curl", "-f", "http://localhost:9906/js/entry/index.js" ] || exit 1
CMD ["npm", "run", "start"]
