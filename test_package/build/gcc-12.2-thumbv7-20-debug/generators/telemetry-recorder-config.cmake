########## MACROS ###########################################################################
#############################################################################################

# Requires CMake > 3.15
if(${CMAKE_VERSION} VERSION_LESS "3.15")
    message(FATAL_ERROR "The 'CMakeDeps' generator only works with CMake >= 3.15")
endif()

if(telemetry-recorder_FIND_QUIETLY)
    set(telemetry-recorder_MESSAGE_MODE VERBOSE)
else()
    set(telemetry-recorder_MESSAGE_MODE STATUS)
endif()

include(${CMAKE_CURRENT_LIST_DIR}/cmakedeps_macros.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/telemetry-recorderTargets.cmake)
include(CMakeFindDependencyMacro)

check_build_type_defined()

foreach(_DEPENDENCY ${telemetry-recorder_FIND_DEPENDENCY_NAMES} )
    # Check that we have not already called a find_package with the transitive dependency
    if(NOT ${_DEPENDENCY}_FOUND)
        find_dependency(${_DEPENDENCY} REQUIRED ${${_DEPENDENCY}_FIND_MODE})
    endif()
endforeach()

set(telemetry-recorder_VERSION_STRING "0.0.2")
set(telemetry-recorder_INCLUDE_DIRS ${telemetry-recorder_INCLUDE_DIRS_DEBUG} )
set(telemetry-recorder_INCLUDE_DIR ${telemetry-recorder_INCLUDE_DIRS_DEBUG} )
set(telemetry-recorder_LIBRARIES ${telemetry-recorder_LIBRARIES_DEBUG} )
set(telemetry-recorder_DEFINITIONS ${telemetry-recorder_DEFINITIONS_DEBUG} )

# Only the first installed configuration is included to avoid the collision
foreach(_BUILD_MODULE ${telemetry-recorder_BUILD_MODULES_PATHS_DEBUG} )
    message(${telemetry-recorder_MESSAGE_MODE} "Conan: Including build module from '${_BUILD_MODULE}'")
    include(${_BUILD_MODULE})
endforeach()


