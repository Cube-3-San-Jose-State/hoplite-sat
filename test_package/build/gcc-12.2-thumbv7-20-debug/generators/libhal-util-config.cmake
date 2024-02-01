########## MACROS ###########################################################################
#############################################################################################

# Requires CMake > 3.15
if(${CMAKE_VERSION} VERSION_LESS "3.15")
    message(FATAL_ERROR "The 'CMakeDeps' generator only works with CMake >= 3.15")
endif()

if(libhal-util_FIND_QUIETLY)
    set(libhal-util_MESSAGE_MODE VERBOSE)
else()
    set(libhal-util_MESSAGE_MODE STATUS)
endif()

include(${CMAKE_CURRENT_LIST_DIR}/cmakedeps_macros.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/libhal-utilTargets.cmake)
include(CMakeFindDependencyMacro)

check_build_type_defined()

foreach(_DEPENDENCY ${libhal-util_FIND_DEPENDENCY_NAMES} )
    # Check that we have not already called a find_package with the transitive dependency
    if(NOT ${_DEPENDENCY}_FOUND)
        find_dependency(${_DEPENDENCY} REQUIRED ${${_DEPENDENCY}_FIND_MODE})
    endif()
endforeach()

set(libhal-util_VERSION_STRING "3.0.1")
set(libhal-util_INCLUDE_DIRS ${libhal-util_INCLUDE_DIRS_DEBUG} )
set(libhal-util_INCLUDE_DIR ${libhal-util_INCLUDE_DIRS_DEBUG} )
set(libhal-util_LIBRARIES ${libhal-util_LIBRARIES_DEBUG} )
set(libhal-util_DEFINITIONS ${libhal-util_DEFINITIONS_DEBUG} )

# Only the first installed configuration is included to avoid the collision
foreach(_BUILD_MODULE ${libhal-util_BUILD_MODULES_PATHS_DEBUG} )
    message(${libhal-util_MESSAGE_MODE} "Conan: Including build module from '${_BUILD_MODULE}'")
    include(${_BUILD_MODULE})
endforeach()


