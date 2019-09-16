FROM alpine:latest as tf-env
ARG TF_VERSION=0.11.10
RUN apk update
RUN apk add wget unzip
WORKDIR /tmp
RUN echo "Installing TF Version ${TF_VERSION}"
RUN wget https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip
RUN unzip terraform_${TF_VERSION}_linux_amd64.zip
RUN mv terraform /bin/terraform

# Note, we cannot set the runner-version via ARG here.  this is by design with docker
# https://stackoverflow.com/questions/53681522/multi-stage-dockerfile-arg-before-from-not-substituted
FROM ansible/ansible-runner:1.3.4
ARG ANSIBLE_VERSION=2.8.5
RUN echo "Installing Ansible Version: ${ANSIBLE_VERSION}"
RUN pip --version
RUN pip install ansible==$ANSIBLE_VERSION
RUN pip install hvac certifi boto botocore boto3
COPY --from=tf-env /bin/terraform /bin/terraform


