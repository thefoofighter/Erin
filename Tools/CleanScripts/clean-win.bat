@echo off

chdir ../../
del /S /Q Makefile
del /S /Q *.sln
del /S /Q *.vcxproj
del /S /Q *.vcxproj.filters
del /S /Q *.vcxproj.user
rmdir /S /Q Build
rmdir /S /Q Erin\3rdparty\glfw\Build

pause
