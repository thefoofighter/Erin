xcopy config\glfw-premake-config.lua ..\..\Erin\3rdparty\glfw
xcopy config\glad-premake-config.lua ..\..\Erin\3rdparty\glad
xcopy config\imgui-premake-config.lua ..\..\Erin\3rdparty\imgui
xcopy config\erin-premake-config.lua ..\..\

chdir ..\..\

call Tools\Binaries\premake\premake5-win.exe --file=erin-premake-config.lua --os=windows gmake

del erin-premake-config.lua
del Erin\3rdparty\glfw\glfw-premake-config.lua
del Erin\3rdparty\glad\glad-premake-config.lua
del Erin\3rdparty\imgui\imgui-premake-config.lua

call Tools\Binaries\sed\sed.exe -i -e "s/--no-print-directory/--print-directory/g" Makefile

pause