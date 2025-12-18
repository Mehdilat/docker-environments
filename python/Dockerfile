FROM python:3.12-slim

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

WORKDIR /app

RUN apk add --no-cache git

RUN git config --global user.name "Mahdi" \
    && git config --global user.email "Madilat@gmail.com" \
    && git config --global credential.helper store \
    && echo "https://$GIT_TOKEN@github.com" > ~/.git-credentials

    CMD ["tail", "-f", "/dev/null"]
