cmake_minimum_required ( VERSION 3.15.0 )

# retrieve all headers and source files
file( GLOB_RECURSE SRC_REC     "src/*.cpp" )
file( GLOB_RECURSE INL_REC     "include/*.inl" )
file( GLOB_RECURSE INCLUDE_REC "include/*.h" )

set( BREW_FILES ${BREW_FILES} ${SRC_REC} )
set( BREW_FILES ${BREW_FILES} ${INL_REC} )
set( BREW_FILES ${BREW_FILES} ${INCLUDE_REC} )

#status updates
message( STATUS "---------------------------------------" )
message( STATUS "brew files:" )
message( STATUS "---------------------------------------" )

foreach(SourceFile ${BREW_FILES})
	message(STATUS ${SourceFile})
endforeach()

message( STATUS "---------------------------------------" )

#include directories
include_directories( "include" )

add_executable( brew ${BREW_FILES} )

#add solution filters
source_group( TREE ${CMAKE_CURRENT_SOURCE_DIR} FILES ${BREW_FILES} )