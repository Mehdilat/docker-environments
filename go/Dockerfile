FROM golang:1.23-alpine

WORKDIR /app

RUN apk add --no-cache git

RUN git config --global user.name "$GIT_NAME" \
    && git config --global user.email "$GIT_EMAIL" \
    && git config --global credential.helper store \
    && echo "https://$GIT_TOKEN@github.com" > ~/.git-credentials

CMD ["tail", "-f", "/dev/null"]
