########## MACROS ###########################################################################
#############################################################################################

# Requires CMake > 3.15
if(${CMAKE_VERSION} VERSION_LESS "3.15")
    message(FATAL_ERROR "The 'CMakeDeps' generator only works with CMake >= 3.15")
endif()

if(ring-span-lite_FIND_QUIETLY)
    set(ring-span-lite_MESSAGE_MODE VERBOSE)
else()
    set(ring-span-lite_MESSAGE_MODE STATUS)
endif()

include(${CMAKE_CURRENT_LIST_DIR}/cmakedeps_macros.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/ring-span-liteTargets.cmake)
include(CMakeFindDependencyMacro)

check_build_type_defined()

foreach(_DEPENDENCY ${ring-span-lite_FIND_DEPENDENCY_NAMES} )
    # Check that we have not already called a find_package with the transitive dependency
    if(NOT ${_DEPENDENCY}_FOUND)
        find_dependency(${_DEPENDENCY} REQUIRED ${${_DEPENDENCY}_FIND_MODE})
    endif()
endforeach()

set(ring-span-lite_VERSION_STRING "0.6.0")
set(ring-span-lite_INCLUDE_DIRS ${ring-span-lite_INCLUDE_DIRS_DEBUG} )
set(ring-span-lite_INCLUDE_DIR ${ring-span-lite_INCLUDE_DIRS_DEBUG} )
set(ring-span-lite_LIBRARIES ${ring-span-lite_LIBRARIES_DEBUG} )
set(ring-span-lite_DEFINITIONS ${ring-span-lite_DEFINITIONS_DEBUG} )

# Only the first installed configuration is included to avoid the collision
foreach(_BUILD_MODULE ${ring-span-lite_BUILD_MODULES_PATHS_DEBUG} )
    message(${ring-span-lite_MESSAGE_MODE} "Conan: Including build module from '${_BUILD_MODULE}'")
    include(${_BUILD_MODULE})
endforeach()


