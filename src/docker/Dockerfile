FROM sourcey/spectacle

# customise scss where required
ENV SWAGGER_FILE "api.yml"

VOLUME /gen

COPY build.sh .
COPY logo.png . 
COPY _foundation-settings.scss /usr/local/lib/node_modules/spectacle-docs/app/stylesheets/_foundation-settings.scss

LABEL version="1.0.0"
LABEL description="Container for creating documentation from swagger files using the excellent https://github.com/sourcey/spectacle"


# exec spectacle command against volume path
CMD ["./build.sh"]

