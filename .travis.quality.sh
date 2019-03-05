#!/bin/bash

#Check formatting
if [ -n "$(gofmt -l .)" ]; then
    echo "Go code is not formatted:"
    gofmt -d .
    exit 1
fi

#Check Security Issues
CMD="gosec -quiet -exclude=G104 main.go"
if [ -n "`$CMD`" ]; then
   echo "Security Issues"
   exit 2
fi

