#!/bin/zsh
export $(xargs <.env)

APP_DIR=terraform/app

terraform -chdir=$APP_DIR init &&
  terraform -chdir=$APP_DIR apply -auto-approve