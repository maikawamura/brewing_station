@echo off

set CMAKE= "C:\Program Files\CMake\bin\cmake.exe"
echo CMake directory: %CMAKE%

set GENERATOR= "Visual Studio 16 2019"
echo generator: %GENERATOR%

set PLATFORM= "x64"
echo platform: %PLATFORM%

set SOURCE_DIR= %cd%\code
echo source directory: %SOURCE_DIR%

set BUILD_DIR= %SOURCE_DIR%\..\build
echo build directory: %BUILD_DIR%

set CMAKE_CACHE= %BUILD_DIR%\CMakeCache.txt
set CPACK_CACHE= %SOURCE_DIR%\CPackConfig.cmake
set CTEST_CACHE= %SOURCE_DIR%\CTestConfig.cmake

if EXIST %CMAKE_CACHE% del %CMAKE_CACHE% 
if EXIST %CPACK_CACHE% del %CPACK_CACHE%
if EXIST %CTEST_CACHE% del %CTEST_CACHE%

mkdir %BUILD_DIR%
cd %BUILD_DIR%

%CMAKE% -G %GENERATOR% -A %PLATFORM% %SOURCE_DIR% 


goto error
goto success

:error
pause
:success