cmake_minimum_required(VERSION 2.8)
project(my_muduo)

set(LIBRARY_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/lib)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g -std=c++1")

aux_source_directory(. SRC_LIST)

add_library(my_muduo SHARED ${SRC_LIST})