FROM docker.io/antora/antora:2.3.4

COPY ./entrypoint.sh /entrypoint.sh

# for generating the search bar index
RUN npm i -g antora-site-generator-lunr

ENTRYPOINT ["/entrypoint.sh"]
