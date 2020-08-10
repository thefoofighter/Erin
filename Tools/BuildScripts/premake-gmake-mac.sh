#!/bin/bash
cp config/erin-premake-config.lua ../../
cd ../../
./Tools/Binaries/premake/premake5-mac --file=erin-premake-config.lua --os=macosx gmake
rm erin-premake-config.lua