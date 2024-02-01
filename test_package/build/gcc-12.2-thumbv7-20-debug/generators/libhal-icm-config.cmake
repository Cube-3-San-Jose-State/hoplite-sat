########## MACROS ###########################################################################
#############################################################################################

# Requires CMake > 3.15
if(${CMAKE_VERSION} VERSION_LESS "3.15")
    message(FATAL_ERROR "The 'CMakeDeps' generator only works with CMake >= 3.15")
endif()

if(libhal-icm_FIND_QUIETLY)
    set(libhal-icm_MESSAGE_MODE VERBOSE)
else()
    set(libhal-icm_MESSAGE_MODE STATUS)
endif()

include(${CMAKE_CURRENT_LIST_DIR}/cmakedeps_macros.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/libhal-icmTargets.cmake)
include(CMakeFindDependencyMacro)

check_build_type_defined()

foreach(_DEPENDENCY ${libhal-icm_FIND_DEPENDENCY_NAMES} )
    # Check that we have not already called a find_package with the transitive dependency
    if(NOT ${_DEPENDENCY}_FOUND)
        find_dependency(${_DEPENDENCY} REQUIRED ${${_DEPENDENCY}_FIND_MODE})
    endif()
endforeach()

set(libhal-icm_VERSION_STRING "0.0.1")
set(libhal-icm_INCLUDE_DIRS ${libhal-icm_INCLUDE_DIRS_DEBUG} )
set(libhal-icm_INCLUDE_DIR ${libhal-icm_INCLUDE_DIRS_DEBUG} )
set(libhal-icm_LIBRARIES ${libhal-icm_LIBRARIES_DEBUG} )
set(libhal-icm_DEFINITIONS ${libhal-icm_DEFINITIONS_DEBUG} )

# Only the first installed configuration is included to avoid the collision
foreach(_BUILD_MODULE ${libhal-icm_BUILD_MODULES_PATHS_DEBUG} )
    message(${libhal-icm_MESSAGE_MODE} "Conan: Including build module from '${_BUILD_MODULE}'")
    include(${_BUILD_MODULE})
endforeach()


