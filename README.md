# Terraform and Ansible Container

Just a simple container for a personal project that builds Ansible and Terraform together.  This was built for a gitlab runner project/pipeline I needed.

## Containers made from this repo on dockerhub
* `nickmaccarthy/terraform-0.11.10-ansible-runner-1.3.4:2.8.5` - Contains both Terraform 0.11.10, Ansible Runner 1.3.4 and Ansible 2.8.5.  Also inclused the hvac, certifi, boto, botocore, and boto3 pip modules

## Deployment
* docker build -t terraform-<tf_version>-ansible-runner-<runner_version>:<ansible_version>
* docker tag terraform-<tf_version>-ansible-runner-<runner_version> <docker_username>/terraform-<tf_version>-ansible-runner-<runner_version>:<ansible_version>
* docker push <docker_username>/terraform-<tf_version>-ansible-runner-<runner_version>:<ansible_version>

Example:
```
docker build -t terraform-0.11.10-ansible-runner-1.3.4:2.8.5 .
docker tag terraform-0.11.10-ansible-runner-1.3.4 nickmaccarthy/terraform-0.11.10-ansible-runner-1.3.4:2.8.5
docker push nickmaccarthy/terraform-0.11.10-ansible-runner-1.3.4:2.8.5
```

# Build Args
* `TF_VERSION` What TF version you want to install
* `ANSIBLE_VERSION` What Ansible version you want to install
Note: You cannot set an ARG and use it with `FROM`, i.e. we can't specify our ansible runner version this way.  So for now, it has to be hard coded.  This is by design from Docker: https://stackoverflow.com/questions/53681522/multi-stage-dockerfile-arg-before-from-not-substituted


