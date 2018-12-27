FROM gcr.io/google-appengine/php:latest

ENV DOCUMENT_ROOT /app
WORKDIR /app/

COPY . .

