cmake_minimum_required ( VERSION 3.15.0 )

project( BREWINGSTATIOn )

message(STATUS "CMAKE_SYSTEM_VERSION = ${CMAKE_SYSTEM_VERSION}")

#target output directory
set ( CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/lib" )
set ( CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/lib" )
set ( CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin" )

set ( VALID_BUILD_TYPES "Release" "Debug" ) #TODO ? 

set( BREWINGSTATION_TARGET_PLATFORM "Windows" CACHE STRING "What platform are you working on?" )
set_property( CACHE BREWINGSTATION_TARGET_PLATFORM PROPERTY STRINGS "Windows" "AndroidTODO" )

set( BREWINGSTATION_STARTUP_PROJECT "cauldron" CACHE STRING "Choose your startup project for convenience." )
set_property( CACHE BREWINGSTATION_STARTUP_PROJECT PROPERTY STRINGS "cauldron" "brew" ) #TODO doesn't work yet

set_property( GLOBAL PROPERTY USE_FOLDERS ON )

set( CMAKE_CONFIGURATION_TYPES "Debug;Release" CACHE STRING "" FORCE )

#set( CMAKE_CONFIGURATION_TYPES "Debug;Release" ) 
#set( CMAKE_CONFIGURATION_TYPES "${CMAKE_CONFIGURATION_TYPES}" 
 #   CACHE STRING "List of supported configurations.")


#add projects
add_subdirectory ( brew )
add_subdirectory ( cauldron_native )

#set( CAULDRON_BINARY_DIR  )
include_external_msproject( cauldron "${CMAKE_CURRENT_SOURCE_DIR}/cauldron/cauldron.csproj" )


#set startup project
set_property( DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT "${BREWINGSTATION_STARTUP_PROJECT}" )

#set install targets
install( TARGETS brew DESTINATION "bin/brew" )
#install( DIRECTORY "${CMAKE_BINARY_DIR}/bin/Debug/" DESTINATION "bin/cauldron/Debug" ) TODO
#install( DIRECTORY "${CMAKE_BINARY_DIR}/bin/Release/" DESTINATION "bin/cauldron" )

include( CTest )

add_test( "testTODO" "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}" )

include( CPack )