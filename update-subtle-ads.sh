#! /bin/bash

echo off

# uncomment, if you need build the container image
# docker build --tag subtle-ads:auto .

docker run --interactive --tty --rm subtle-ads:auto
