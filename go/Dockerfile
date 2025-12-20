# Original Image
FROM golang:1.23-alpine
WORKDIR /app

# Install dependencies
RUN apk add --no-cache \
    git \
    wget \
    gnupg \
    sudo \
    unzip \
    groff \
    less \
    python3 \
    py3-pip \
    make

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

# Install AWS CLI (pip for Alpine)
RUN pip3 install --upgrade pip --break-system-packages \
    && pip3 install awscli --break-system-packages \
    && aws --version

# Configure AWS CLI
RUN mkdir -p /root/.aws && \
    echo "[default]" > /root/.aws/credentials && \
    echo "aws_access_key_id = ${AWS_ACCESS_KEY_ID}" >> /root/.aws/credentials && \
    echo "aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}" >> /root/.aws/credentials && \
    echo "[default]" > /root/.aws/config && \
    echo "region = ${AWS_DEFAULT_REGION:-us-east-1}" >> /root/.aws/config && \
    echo "output = json" >> /root/.aws/config

# Execute to keep running
CMD ["tail", "-f", "/dev/null"]
