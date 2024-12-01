# cmake_minimum_required(VERSION 2.8)
# project(my_muduo)

# set(LIBRARY_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/lib)

# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g -std=c++11")

# aux_source_directory(. SRC_LIST)

# add_library(my_muduo SHARED ${SRC_LIST})

# 设置 CMake 的最低版本要求
cmake_minimum_required(VERSION 2.8)

# 设置项目名称
project(MyProject)

# 设置 C++ 标准
set(CMAKE_CXX_STANDARD 11)

# 包含头文件目录（如果需要）
include_directories(${PROJECT_SOURCE_DIR})

# 定义源文件
set(SOURCES
    main.cc
    Timestamp.cc
    InetAddress.cc
)

# 添加可执行文件
add_executable(my_program ${SOURCES})
