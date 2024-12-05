# 设置 CMake 的最低版本要求
cmake_minimum_required(VERSION 2.8)

# 设置项目名称
project(MyProject)

# 设置 C++ 标准
set(CMAKE_CXX_STANDARD 11)

# 包含头文件目录（如果需要）
include_directories(${PROJECT_SOURCE_DIR})

# 自动获取当前目录及子目录下所有的 .cc 文件
file(GLOB SOURCES
    ${PROJECT_SOURCE_DIR}/*.cc  # 获取当前目录下的所有 .cc 文件
    ${PROJECT_SOURCE_DIR}/**/*.cc  # 获取所有子目录下的 .cc 文件
)

# 添加可执行文件
add_executable(my_program ${SOURCES})

target_link_libraries(my_program pthread rt)
