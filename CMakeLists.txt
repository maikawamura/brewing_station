cmake_minimum_required ( VERSION 3.15.0 )

project( brewing_station )

message(STATUS "CMAKE_SYSTEM_VERSION = ${CMAKE_SYSTEM_VERSION}")

#target output directory
set ( CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/lib" )
set ( CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/lib" )
set ( CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin" )

set ( VALID_BUILD_TYPES "Release" "Debug" )

set( TARGET_PLATFORM "Windows" CACHE STRING "What platform are you working on?" )

set_property( CACHE TARGET_PLATFORM PROPERTY STRINGS "Windows" "Android" )
set_property( GLOBAL PROPERTY USE_FOLDERS ON )

#set( CMAKE_CONFIGURATION_TYPES "Debug;Release" ) 
#set( CMAKE_CONFIGURATION_TYPES "${CMAKE_CONFIGURATION_TYPES}" 
 #   CACHE STRING "List of supported configurations.")



add_subdirectory ( cauldron_native )
include_external_msproject( cauldron "${CMAKE_CURRENT_SOURCE_DIR}/cauldron/cauldron.csproj" )

set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT cauldron)

include( CTest )

add_test( "testTODO" "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}" )

include( CPack )