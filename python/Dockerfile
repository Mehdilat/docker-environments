# Original Image
FROM python:3.12-slim
WORKDIR /app

# Install dependencies
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Install dependencies
RUN apk add --no-cache \
    git \
    wget \
    gnupg \
    sudo

# Configure git
RUN git config --global user.name "$GIT_NAME" \
    && git config --global user.email "$GIT_EMAIL" \
    && git config --global credential.helper store \
    && echo "https://$GIT_TOKEN@github.com" > ~/.git-credentials

# Install Terraform
RUN wget -O terraform.zip https://releases.hashicorp.com/terraform/1.9.8/terraform_1.9.8_linux_amd64.zip \
    && unzip terraform.zip \
    && mv terraform /usr/local/bin/ \
    && rm terraform.zip \
    && terraform --version

CMD ["tail", "-f", "/dev/null"]
