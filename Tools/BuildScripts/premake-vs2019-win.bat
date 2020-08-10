xcopy config\erin-premake-config.lua ..\..\
chdir ..\..\
call Tools\Bin\premake\premake5-win.exe --file=erin-premake-config.lua --os=windows vs2019
del erin-premake-config.lua
pause