# FindEDLib.cmake
# ----------------
# Find EDLib library
#
# This will define the following variables
# EDLib_FOUND - System has EDLib
# EDLib_INCLUDE_DIRS - The EDLib include directories
# EDLib_LIBRARIES - The libraries needed to use EDLib

########################################################################
## installation root
########################################################################
if (UNIX)
  get_filename_component(EDLib_ROOT "${CMAKE_CURRENT_LIST_DIR}/../../.." ABSOLUTE)
elseif (WIN32)
  get_filename_component(EDLib_ROOT "${CMAKE_CURRENT_LIST_DIR}/.." ABSOLUTE)
endif ()

########################################################################
## locate the library
########################################################################
find_library(
  EDLib_LIBRARY EDLib
  PATHS ${EDLib_ROOT}/lib${LIB_SUFFIX}
  PATH_SUFFIXES ${CMAKE_LIBRARY_ARCHITECTURE}
  NO_DEFAULT_PATH
  )
if(NOT EDLib_LIBRARY)
  message(FATAL_ERROR "cannot find EDLib library in ${EDLib_ROOT}/lib${LIB_SUFFIX}")
endif()
set(EDLib_LIBRARIES ${EDLib_LIBRARY})

########################################################################
## locate the includes
########################################################################
find_path(
  EDLib_INCLUDE_DIR EDLib.h
  PATHS ${EDLib_ROOT}/include/EDLib
  NO_DEFAULT_PATH
)
if(NOT EDLib_INCLUDE_DIR)
  message(FATAL_ERROR "cannot find EDLib includes in ${EDLib_ROOT}/include/EDLib")
endif()
set(EDLib_INCLUDE_DIRS ${EDLib_INCLUDE_DIR})

mark_as_advanced(EDLib_INCLUDE_DIRS EDLib_LIBRARIES)