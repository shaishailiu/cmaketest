cmake_minimum_required(VERSION 2.8.9)

project (mathlib)

#include_directories(math)

file(GLOB SOURCES "../math/*.*")

add_library(math STATIC ${SOURCES})