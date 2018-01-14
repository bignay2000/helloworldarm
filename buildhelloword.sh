#!/bin/bash

#This script runs on X86 but will generate an ARM 32 compiled helloword linux executible "helloworldlinuxarm" that is compatible with the Raspberry Pi Zero W

docker run --rm -v "$PWD":/usr/src/helloworldlinuxarm -w /usr/src/helloworldlinuxarm -e GOOS=linux -e GOARCH=arm golang go build -v