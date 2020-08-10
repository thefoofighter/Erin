@echo off

chdir ../../
del /S /Q Makefile
del /S /Q *.sln
del /S /Q *.vcxproj
del /S /Q *.vcxproj.filters
rmdir /S /Q Build

pause
