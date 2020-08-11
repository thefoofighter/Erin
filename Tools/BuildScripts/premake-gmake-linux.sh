#!/bin/bash
cp config/glfw-premake-config.lua ../../Erin/3rdparty/glfw
cp config/erin-premake-config.lua ../../
cd ../../
./Tools/Binaries/premake/premake5-linux --file=erin-premake-config.lua --os=linux gmake
rm erin-premake-config.lua
rm Erin/3rdparty/glfw/glfw-premake-config.lua