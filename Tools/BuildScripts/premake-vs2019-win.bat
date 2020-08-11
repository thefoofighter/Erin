xcopy config\glfw-premake-config.lua ..\..\Erin\3rdparty\glfw
xcopy config\erin-premake-config.lua ..\..\
chdir ..\..\
call Tools\Binaries\premake\premake5-win.exe --file=erin-premake-config.lua --os=windows vs2019
del erin-premake-config.lua
del Erin\3rdparty\glfw\glfw-premake-config.lua
pause