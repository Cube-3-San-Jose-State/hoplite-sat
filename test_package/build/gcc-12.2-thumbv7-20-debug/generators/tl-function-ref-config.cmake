########## MACROS ###########################################################################
#############################################################################################

# Requires CMake > 3.15
if(${CMAKE_VERSION} VERSION_LESS "3.15")
    message(FATAL_ERROR "The 'CMakeDeps' generator only works with CMake >= 3.15")
endif()

if(tl-function-ref_FIND_QUIETLY)
    set(tl-function-ref_MESSAGE_MODE VERBOSE)
else()
    set(tl-function-ref_MESSAGE_MODE STATUS)
endif()

include(${CMAKE_CURRENT_LIST_DIR}/cmakedeps_macros.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/tl-function-refTargets.cmake)
include(CMakeFindDependencyMacro)

check_build_type_defined()

foreach(_DEPENDENCY ${tl-function-ref_FIND_DEPENDENCY_NAMES} )
    # Check that we have not already called a find_package with the transitive dependency
    if(NOT ${_DEPENDENCY}_FOUND)
        find_dependency(${_DEPENDENCY} REQUIRED ${${_DEPENDENCY}_FIND_MODE})
    endif()
endforeach()

set(tl-function-ref_VERSION_STRING "1.0.0")
set(tl-function-ref_INCLUDE_DIRS ${tl-function-ref_INCLUDE_DIRS_DEBUG} )
set(tl-function-ref_INCLUDE_DIR ${tl-function-ref_INCLUDE_DIRS_DEBUG} )
set(tl-function-ref_LIBRARIES ${tl-function-ref_LIBRARIES_DEBUG} )
set(tl-function-ref_DEFINITIONS ${tl-function-ref_DEFINITIONS_DEBUG} )

# Only the first installed configuration is included to avoid the collision
foreach(_BUILD_MODULE ${tl-function-ref_BUILD_MODULES_PATHS_DEBUG} )
    message(${tl-function-ref_MESSAGE_MODE} "Conan: Including build module from '${_BUILD_MODULE}'")
    include(${_BUILD_MODULE})
endforeach()


