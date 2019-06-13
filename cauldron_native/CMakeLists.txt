cmake_minimum_required ( VERSION 3.15.0 )

# retrieve all headers and source files
file( GLOB_RECURSE SRC_REC     "src/*.cpp" )
file( GLOB_RECURSE INL_REC     "include/*.inl" )
file( GLOB_RECURSE INCLUDE_REC "include/*.h" )

set( CAULDRON_FILES ${CAULDRON_FILES} ${SRC_REC} )
set( CAULDRON_FILES ${CAULDRON_FILES} ${INL_REC} )
set( CAULDRON_FILES ${CAULDRON_FILES} ${INCLUDE_REC} )

#status updates
message( STATUS "---------------------------------------" )
message( STATUS "cauldron_native files:" )
message( STATUS "---------------------------------------" )

foreach(SourceFile ${CAULDRON_FILES})
	message(STATUS ${SourceFile})
endforeach()

message( STATUS "---------------------------------------" )

#include directories
include_directories("include")

add_library( cauldron_native ${CAULDRON_FILES} )

#add solution filters
source_group( TREE ${CMAKE_CURRENT_SOURCE_DIR} FILES ${CAULDRON_FILES} )