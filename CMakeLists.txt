cmake_minimum_required(VERSION 3.6)
project(ED_Lib)

set(CMAKE_CXX_STANDARD 11)

find_package(OpenCV)
include_directories(${OpenCV_INCLUDE_DIRS})

add_library(EDLib SHARED
        ED.cpp
        ED.h
        EDCircles.cpp
        EDCircles.h
        EDColor.cpp
        EDColor.h
        EDLib.h
        EDLines.cpp
        EDLines.h
        EDPF.cpp
        EDPF.h
        NFA.cpp
        NFA.h)

install(TARGETS EDLib DESTINATION lib)
install(FILES ED.h EDCircles.h EDColor.h EDLib.h EDLines.h EDPF.h NFA.h DESTINATION include/EDLib)
install(FILES cmake/EDLibConfig.cmake DESTINATION lib/cmake/EDLib)