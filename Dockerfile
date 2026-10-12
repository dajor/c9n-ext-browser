# c9n extension "browser": Chromium behind a Playwright server. c9n's agent scripts keep using Playwright; a small shim in
# the c9n image connects them to this service when C9N_EXT_BROWSER_URL is set.
FROM node:22-bookworm-slim
ARG VERSION
ARG PLAYWRIGHT_VERSION=1.62.0
LABEL org.opencontainers.image.title="c9n-ext-browser" org.opencontainers.image.version=$VERSION \
      app.c9n.extension.core_api="1" app.c9n.extension.playwright=$PLAYWRIGHT_VERSION
ENV PLAYWRIGHT_BROWSERS_PATH=/ms-playwright NODE_ENV=production
RUN npm install -g playwright@${PLAYWRIGHT_VERSION} && playwright install --with-deps chromium \
    && chmod -R a+rX /ms-playwright && rm -rf /var/lib/apt/lists/* /root/.npm
COPY serve.sh /usr/local/bin/serve.sh
RUN chmod 755 /usr/local/bin/serve.sh
# The connection token is part of the address; no token, no server.
USER node
EXPOSE 9300
HEALTHCHECK --interval=10s --timeout=5s --retries=3 --start-period=15s CMD node -e "require('net').connect(9300,'127.0.0.1').on('connect',()=>process.exit(0)).on('error',()=>process.exit(1))"
CMD ["/usr/local/bin/serve.sh"]
