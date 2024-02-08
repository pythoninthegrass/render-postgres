# syntax=docker/dockerfile:1.6

FROM postgres:15.5-alpine3.19

ENV TZ=UTC

RUN apk add --no-cache tzdata

ENV POSTGRES_DB=${POSTGRES_DB:-postgres}
ENV POSTGRES_USER=${POSTGRES_USER:-sa}
ENV POSTGRES_PASSWORD=${POSTGRES_PASSWORD}
ENV POSTGRES_PORT=${POSTGRES_PORT:-5432}

ARG USER_NAME=nonroot

RUN addgroup --system $USER_NAME \
    && adduser --system --ingroup $USER_NAME $USER_NAME \
    && mkdir -p /var/run/postgresql \
    && mkdir -p /var/lib/postgresql/data \
    && mkdir -p /var/log/postgres \
    && chown -R $USER_NAME:$USER_NAME /var/run/postgresql \
    && chown -R $USER_NAME:$USER_NAME /var/lib/postgresql/data \
    && chown -R $USER_NAME:$USER_NAME /var/log/postgres

WORKDIR /data/db

USER $USER_NAME

ARG RENDER_EXTERNAL_URL
ENV URL=${RENDER_EXTERNAL_URL}

EXPOSE ${POSTGRES_PORT}

CMD ["postgres"]
