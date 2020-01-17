cmake_minimum_required(VERSION 2.8.9)

project (main)

include_directories(render)

#set(SOURCES helloworld.cpp math/MathFunctions.cpp)

#file(GLOB SOURCES "*.cpp" "*/*.h" "*/*.cpp")

add_subdirectory(render)

file(GLOB SOURCES "main.cpp")

add_executable(main ${SOURCES})

target_link_libraries(main render)