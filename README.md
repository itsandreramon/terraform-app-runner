# Instructions

Several configuration files depend on common settings. To ensure correct behaviour, add the following environment
variables to the .env file. Also make sure that [Docker](https://www.docker.com/products/docker-desktop) as well as the
latest [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) is installed and
configured.

#### Make sure to provide the following policies to the IAM user used:

- IAMFullAccess
- AWSAppRunnerFullAccess
- AmazonEC2ContainerRegistryFullAccess

#### Create .env file in the root directory

```
AWS_SECRET_ACCESS_KEY=abc
AWS_ACCESS_KEY_ID=123
AWS_ACCOUNT_ID=456
AWS_REGION=us-east-2

TF_VAR_account_id=456
TF_VAR_repository=demo-repository
TF_VAR_service=demo-service
TF_VAR_region=us-east-2
```

#### Setup ECR

```
$ terraform -chdir=terraform/repo init
$ terraform -chdir=terraform/repo apply
```

#### Build the image

```
$ ./image-build.sh
```

#### Upload the image to ECR

```
$ ./image-upload.sh
```

#### Deploy the image with Terraform

```
$ ./deploy-app.sh
```
