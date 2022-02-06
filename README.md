# Instructions

#### Create .env file in the root directory

Several configuration files depend on common settings. To ensure correct behaviour, add the following environment
variables to the .env file.

```
AWS_SECRET_ACCESS_KEY=
AWS_ACCESS_KEY_ID=
AWS_ACCOUNT_ID=
AWS_REGION=

TF_VAR_account_id=
TF_VAR_repository=
TF_VAR_service=
TF_VAR_region=
```

#### Setup ECR

Make sure that the container registry is setup before uploading to it.

```
$ terraform -chdir=terraform/repo init
$ terraform -chdir=terraform/repo apply
```

#### Build the image

The image is built using Spring Boots native image builder.

```
$ ./image-build.sh
```

#### Upload the image to ECR

Make sure that [Docker](https://www.docker.com/products/docker-desktop) as well as the
latest [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) is installed and
configured.

```
$ ./image-upload.sh
```

#### Deploy the image with Terraform

```
$ ./deploy-app.sh
```