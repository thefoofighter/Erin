#!/bin/bash

cd ../../

find . -name "Makefile" -type f -delete
find . -name "*.sln" -type f -delete
find . -name "*.vcxproj" -type f -delete 
find . -name "*.vcxproj.filters" -type f -delete
rm -fr Build/