# Load the debug and release variables
get_filename_component(_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
file(GLOB DATA_FILES "${_DIR}/ring-span-lite-*-data.cmake")

foreach(f ${DATA_FILES})
    include(${f})
endforeach()

# Create the targets for all the components
foreach(_COMPONENT ${ring-span-lite_COMPONENT_NAMES} )
    if(NOT TARGET ${_COMPONENT})
        add_library(${_COMPONENT} INTERFACE IMPORTED)
        message(${ring-span-lite_MESSAGE_MODE} "Conan: Component target declared '${_COMPONENT}'")
    endif()
endforeach()

if(NOT TARGET nonstd::ring-span-lite)
    add_library(nonstd::ring-span-lite INTERFACE IMPORTED)
    message(${ring-span-lite_MESSAGE_MODE} "Conan: Target declared 'nonstd::ring-span-lite'")
endif()
# Load the debug and release library finders
get_filename_component(_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
file(GLOB CONFIG_FILES "${_DIR}/ring-span-lite-Target-*.cmake")

foreach(f ${CONFIG_FILES})
    include(${f})
endforeach()