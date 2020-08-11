#!/bin/bash

cd ../../

find . -name "Makefile" -type f -delete
find . -name "*.sln" -type f -delete
find . -name "*.vcxproj" -type f -delete 
find . -name "*.vcxproj.filters" -type f -delete
find . -name "*.vcxproj.user" -type f -delete

rm -fr Build/
rm -fr Erin/3rdparty/glfw/Build