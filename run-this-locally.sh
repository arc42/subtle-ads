#! /bin/bash

## This is the script that you run locally!!

echo off

# uncomment, if you need build the container image
#docker build --tag subtle-ads .

docker run --interactive --tty --rm subtle-ads:latest
