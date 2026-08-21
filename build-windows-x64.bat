@echo off
setlocal
set "VSDEV=P:\DEV\vs-buildtools\2022\Common7\Tools\VsDevCmd.bat"
set "CMAKE=P:\DEV\cmake-4.3.3-windows-x86_64\bin\cmake.exe"
if not exist "%VSDEV%" echo Visual Studio Build Tools not found.& exit /b 1
if not exist "%CMAKE%" echo CMake not found.& exit /b 1
call "%VSDEV%" -arch=x64 -host_arch=x64 || exit /b 1
"%CMAKE%" -S "%~dp0" -B "%~dp0build-nmake" -G "NMake Makefiles" -DCMAKE_BUILD_TYPE=Release || exit /b 1
"%CMAKE%" --build "%~dp0build-nmake" || exit /b 1
echo Built: %~dp0build-nmake\reaper_dax_mcu-x64.dll
