# Original Image
FROM python:3.12-slim
WORKDIR /app

# Copy uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Install dependencies
RUN apt-get update && apt-get install -y \
    sudo \
    git \
    wget \
    make \
    bash \
    openssh-client \
    unzip \
    gnupg \
    groff \
    less \
    && rm -rf /var/lib/apt/lists/*

# Configure git
RUN git config --global user.name "${GIT_NAME:-Mahdi}" \
    && git config --global user.email "${GIT_EMAIL:-Madilat@example.com}" \
    && git config --global credential.helper store \
    && echo "https://${GIT_TOKEN}@github.com" > ~/.git-credentials

# Install Terraform
RUN wget -O terraform.zip https://releases.hashicorp.com/terraform/1.9.8/terraform_1.9.8_linux_amd64.zip \
    && unzip terraform.zip \
    && mv terraform /usr/local/bin/ \
    && rm terraform.zip \
    && terraform --version

# Install AWS CLI v2 (Binary for Debian)
RUN wget "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -O "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -rf aws awscliv2.zip \
    && aws --version

CMD ["tail", "-f", "/dev/null"]
