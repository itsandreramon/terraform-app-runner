#!/bin/bash
export $(xargs <.env)

./gradlew bootBuildImage --imageName="${TF_VAR_service}:latest"