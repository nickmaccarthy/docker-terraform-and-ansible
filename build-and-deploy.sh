#!/bin/bash

export DOCKERHUB_USER=nickmaccarthy
export TF_VERSION=0.11.10
export ANSIBLE_VERSION=2.8.5
export RUNNER_VERSION=1.3.4

docker build -t terraform-$TF_VERSION-ansible-runner-$RUNNER_VERSION:$ANSIBLE_VERSION --build-arg TF_VERSION=$TF_VERSION --build-arg ANSIBLE_VERSION=$ANSIBLE_VERSION .
docker tag terraform-$TF_VERSION-ansible-runner-$RUNNER_VERSION:$ANSIBLE_VERSION $DOCKERHUB_USER/terraform-$TF_VERSION-ansible-runner-$RUNNER_VERSION:$ANSIBLE_VERSION
docker push $DOCKERHUB_USER/terraform-$TF_VERSION-ansible-runner-$RUNNER_VERSION:$ANSIBLE_VERSION
