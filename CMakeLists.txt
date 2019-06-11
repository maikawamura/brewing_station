cmake_minimum_required( VERSION "3.15.0" )

project( "brewing_station" )

add_executable( "${PROJECT_NAME}" "main.cpp" )

install( TARGETS "${PROJECT_NAME}" DESTINATION bin )

install( FILES "main.cpp" DESTINATION src )
#ADD_SUBDIRECTORY( src )

include( CTest )

add_test( "test1" "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}" )
