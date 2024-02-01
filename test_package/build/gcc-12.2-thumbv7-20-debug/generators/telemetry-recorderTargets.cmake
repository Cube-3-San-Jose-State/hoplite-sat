# Load the debug and release variables
get_filename_component(_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
file(GLOB DATA_FILES "${_DIR}/telemetry-recorder-*-data.cmake")

foreach(f ${DATA_FILES})
    include(${f})
endforeach()

# Create the targets for all the components
foreach(_COMPONENT ${telemetry-recorder_COMPONENT_NAMES} )
    if(NOT TARGET ${_COMPONENT})
        add_library(${_COMPONENT} INTERFACE IMPORTED)
        message(${telemetry-recorder_MESSAGE_MODE} "Conan: Component target declared '${_COMPONENT}'")
    endif()
endforeach()

if(NOT TARGET libhal::telemetry-recorder)
    add_library(libhal::telemetry-recorder INTERFACE IMPORTED)
    message(${telemetry-recorder_MESSAGE_MODE} "Conan: Target declared 'libhal::telemetry-recorder'")
endif()
# Load the debug and release library finders
get_filename_component(_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
file(GLOB CONFIG_FILES "${_DIR}/telemetry-recorder-Target-*.cmake")

foreach(f ${CONFIG_FILES})
    include(${f})
endforeach()