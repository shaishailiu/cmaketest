cmake_minimum_required(VERSION 2.8.9)

project (hello)

#include_directories(math)

#set(SOURCES helloworld.cpp math/MathFunctions.cpp)

#file(GLOB SOURCES "*.cpp" "*/*.h" "*/*.cpp")

add_subdirectory(math)

file(GLOB SOURCES "helloworld.cpp")

function(assign_source_group)
    if(MSVC)
    foreach(_source IN ITEMS ${ARGN})
        if (IS_ABSOLUTE "${_source}")
            file(RELATIVE_PATH _source_rel "${CMAKE_CURRENT_SOURCE_DIR}" "${_source}")
        else()
            set(_source_rel "${_source}")
        endif()
        get_filename_component(_source_path "${_source_rel}" PATH)
        string(REPLACE "/" "\\" _source_path_msvc "${_source_path}")
        source_group("${_source_path_msvc}" FILES "${_source}")
    endforeach()
    endif(MSVC)
endfunction(assign_source_group)

function(group_vs)
    foreach(_source IN ITEMS ${ARGN})
        assign_source_group(${_source})
    endforeach()
endfunction(group_vs)

group_vs(${SOURCES})

add_executable(hello ${SOURCES})

target_link_libraries(hello mathlib)