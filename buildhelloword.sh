#!/bin/bash

#This script runs on X86 but will generate an ARM compiled helloword linux executible "helloworldlinuxarm"

docker run --rm -v "$PWD":/usr/src/helloworldlinuxarm -w /usr/src/helloworldlinuxarm -e GOOS=linux -e GOARCH=arm golang go build -v