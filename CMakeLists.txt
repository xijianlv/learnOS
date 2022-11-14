cmake_minimum_required(VERSION 3.20)
project(learnOS C)

set(CMAKE_C_STANDARD 99)

add_executable(learnOS main.c tools/fileinfo.c tools/floppy.c)
