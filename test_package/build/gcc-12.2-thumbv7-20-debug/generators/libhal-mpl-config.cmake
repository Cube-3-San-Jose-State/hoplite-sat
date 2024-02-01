########## MACROS ###########################################################################
#############################################################################################

# Requires CMake > 3.15
if(${CMAKE_VERSION} VERSION_LESS "3.15")
    message(FATAL_ERROR "The 'CMakeDeps' generator only works with CMake >= 3.15")
endif()

if(libhal-mpl_FIND_QUIETLY)
    set(libhal-mpl_MESSAGE_MODE VERBOSE)
else()
    set(libhal-mpl_MESSAGE_MODE STATUS)
endif()

include(${CMAKE_CURRENT_LIST_DIR}/cmakedeps_macros.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/libhal-mplTargets.cmake)
include(CMakeFindDependencyMacro)

check_build_type_defined()

foreach(_DEPENDENCY ${libhal-mpl_FIND_DEPENDENCY_NAMES} )
    # Check that we have not already called a find_package with the transitive dependency
    if(NOT ${_DEPENDENCY}_FOUND)
        find_dependency(${_DEPENDENCY} REQUIRED ${${_DEPENDENCY}_FIND_MODE})
    endif()
endforeach()

set(libhal-mpl_VERSION_STRING "0.0.1")
set(libhal-mpl_INCLUDE_DIRS ${libhal-mpl_INCLUDE_DIRS_DEBUG} )
set(libhal-mpl_INCLUDE_DIR ${libhal-mpl_INCLUDE_DIRS_DEBUG} )
set(libhal-mpl_LIBRARIES ${libhal-mpl_LIBRARIES_DEBUG} )
set(libhal-mpl_DEFINITIONS ${libhal-mpl_DEFINITIONS_DEBUG} )

# Only the first installed configuration is included to avoid the collision
foreach(_BUILD_MODULE ${libhal-mpl_BUILD_MODULES_PATHS_DEBUG} )
    message(${libhal-mpl_MESSAGE_MODE} "Conan: Including build module from '${_BUILD_MODULE}'")
    include(${_BUILD_MODULE})
endforeach()


