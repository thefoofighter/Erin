#!/bin/bash
cp config/glfw-premake-config.lua ../../Erin/3rdparty/glfw
cp config/glad-premake-config.lua ../../Erin/3rdparty/glad
cp config/imgui-premake-config.lua ../../Erin/3rdparty/imgui
cp config/erin-premake-config.lua ../../

cd ../../

./Tools/Binaries/premake/premake5-linux --file=erin-premake-config.lua --os=linux gmake

rm erin-premake-config.lua
rm Erin/3rdparty/glfw/glfw-premake-config.lua
rm Erin/3rdparty/glad/glad-premake-config.lua
rm Erin/3rdparty/imgui/imgui-premake-config.lua

sed -i -e 's/--no-print-directory/--print-directory/g' Makefile