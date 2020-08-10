#!/bin/bash
cp config/erin-premake-config.lua ../../
cd ../../
./Tools/Binaries/premake/premake5-linux --file=erin-premake-config.lua --os=linux gmake
rm erin-premake-config.lua