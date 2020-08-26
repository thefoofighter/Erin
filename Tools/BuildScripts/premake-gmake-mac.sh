#!/bin/bash
cp config/glfw-premake-config.lua ../../Erin/3rdparty/glfw
cp config/glad-premake-config.lua ../../Erin/3rdparty/glad
cp config/erin-premake-config.lua ../../

cd ../../

./Tools/Binaries/premake/premake5-mac --file=erin-premake-config.lua --os=macosx gmake

rm erin-premake-config.lua
rm Erin/3rdparty/glfw/glfw-premake-config.lua
rm Erin/3rdparty/glad/glad-premake-config.lua

sed -i -e 's/--no-print-directory/--print-directory/g' Makefile
rm Makefile-e