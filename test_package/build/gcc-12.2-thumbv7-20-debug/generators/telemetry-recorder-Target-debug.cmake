# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(telemetry-recorder_FRAMEWORKS_FOUND_DEBUG "") # Will be filled later
conan_find_apple_frameworks(telemetry-recorder_FRAMEWORKS_FOUND_DEBUG "${telemetry-recorder_FRAMEWORKS_DEBUG}" "${telemetry-recorder_FRAMEWORK_DIRS_DEBUG}")

set(telemetry-recorder_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET telemetry-recorder_DEPS_TARGET)
    add_library(telemetry-recorder_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET telemetry-recorder_DEPS_TARGET
             PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Debug>:${telemetry-recorder_FRAMEWORKS_FOUND_DEBUG}>
             $<$<CONFIG:Debug>:${telemetry-recorder_SYSTEM_LIBS_DEBUG}>
             $<$<CONFIG:Debug>:libhal::icm;libhal::neo;libhal::mpl;libhal::util;libhal::libhal>
             APPEND)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### telemetry-recorder_DEPS_TARGET to all of them
conan_package_library_targets("${telemetry-recorder_LIBS_DEBUG}"    # libraries
                              "${telemetry-recorder_LIB_DIRS_DEBUG}" # package_libdir
                              "${telemetry-recorder_BIN_DIRS_DEBUG}" # package_bindir
                              "${telemetry-recorder_LIBRARY_TYPE_DEBUG}"
                              "${telemetry-recorder_IS_HOST_WINDOWS_DEBUG}"
                              telemetry-recorder_DEPS_TARGET
                              telemetry-recorder_LIBRARIES_TARGETS  # out_libraries_targets
                              "_DEBUG"
                              "telemetry-recorder"    # package_name
                              "${telemetry-recorder_NO_SONAME_MODE_DEBUG}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${telemetry-recorder_BUILD_DIRS_DEBUG} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Debug ########################################
    set_property(TARGET libhal::telemetry-recorder
                 PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Debug>:${telemetry-recorder_OBJECTS_DEBUG}>
                 $<$<CONFIG:Debug>:${telemetry-recorder_LIBRARIES_TARGETS}>
                 APPEND)

    if("${telemetry-recorder_LIBS_DEBUG}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET libhal::telemetry-recorder
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     telemetry-recorder_DEPS_TARGET
                     APPEND)
    endif()

    set_property(TARGET libhal::telemetry-recorder
                 PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:Debug>:${telemetry-recorder_LINKER_FLAGS_DEBUG}> APPEND)
    set_property(TARGET libhal::telemetry-recorder
                 PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Debug>:${telemetry-recorder_INCLUDE_DIRS_DEBUG}> APPEND)
    # Necessary to find LINK shared libraries in Linux
    set_property(TARGET libhal::telemetry-recorder
                 PROPERTY INTERFACE_LINK_DIRECTORIES
                 $<$<CONFIG:Debug>:${telemetry-recorder_LIB_DIRS_DEBUG}> APPEND)
    set_property(TARGET libhal::telemetry-recorder
                 PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Debug>:${telemetry-recorder_COMPILE_DEFINITIONS_DEBUG}> APPEND)
    set_property(TARGET libhal::telemetry-recorder
                 PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Debug>:${telemetry-recorder_COMPILE_OPTIONS_DEBUG}> APPEND)

########## For the modules (FindXXX)
set(telemetry-recorder_LIBRARIES_DEBUG libhal::telemetry-recorder)
