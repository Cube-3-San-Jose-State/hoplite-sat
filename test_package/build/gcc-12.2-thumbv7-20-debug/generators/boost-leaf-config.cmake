########## MACROS ###########################################################################
#############################################################################################

# Requires CMake > 3.15
if(${CMAKE_VERSION} VERSION_LESS "3.15")
    message(FATAL_ERROR "The 'CMakeDeps' generator only works with CMake >= 3.15")
endif()

if(boost-leaf_FIND_QUIETLY)
    set(boost-leaf_MESSAGE_MODE VERBOSE)
else()
    set(boost-leaf_MESSAGE_MODE STATUS)
endif()

include(${CMAKE_CURRENT_LIST_DIR}/cmakedeps_macros.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/boost-leafTargets.cmake)
include(CMakeFindDependencyMacro)

check_build_type_defined()

foreach(_DEPENDENCY ${boost-leaf_FIND_DEPENDENCY_NAMES} )
    # Check that we have not already called a find_package with the transitive dependency
    if(NOT ${_DEPENDENCY}_FOUND)
        find_dependency(${_DEPENDENCY} REQUIRED ${${_DEPENDENCY}_FIND_MODE})
    endif()
endforeach()

set(boost-leaf_VERSION_STRING "1.83.0")
set(boost-leaf_INCLUDE_DIRS ${boost-leaf_INCLUDE_DIRS_DEBUG} )
set(boost-leaf_INCLUDE_DIR ${boost-leaf_INCLUDE_DIRS_DEBUG} )
set(boost-leaf_LIBRARIES ${boost-leaf_LIBRARIES_DEBUG} )
set(boost-leaf_DEFINITIONS ${boost-leaf_DEFINITIONS_DEBUG} )

# Only the first installed configuration is included to avoid the collision
foreach(_BUILD_MODULE ${boost-leaf_BUILD_MODULES_PATHS_DEBUG} )
    message(${boost-leaf_MESSAGE_MODE} "Conan: Including build module from '${_BUILD_MODULE}'")
    include(${_BUILD_MODULE})
endforeach()


