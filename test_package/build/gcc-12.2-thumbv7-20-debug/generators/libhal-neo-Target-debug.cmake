# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(libhal-neo_FRAMEWORKS_FOUND_DEBUG "") # Will be filled later
conan_find_apple_frameworks(libhal-neo_FRAMEWORKS_FOUND_DEBUG "${libhal-neo_FRAMEWORKS_DEBUG}" "${libhal-neo_FRAMEWORK_DIRS_DEBUG}")

set(libhal-neo_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET libhal-neo_DEPS_TARGET)
    add_library(libhal-neo_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET libhal-neo_DEPS_TARGET
             PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Debug>:${libhal-neo_FRAMEWORKS_FOUND_DEBUG}>
             $<$<CONFIG:Debug>:${libhal-neo_SYSTEM_LIBS_DEBUG}>
             $<$<CONFIG:Debug>:libhal::util;libhal::libhal>
             APPEND)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### libhal-neo_DEPS_TARGET to all of them
conan_package_library_targets("${libhal-neo_LIBS_DEBUG}"    # libraries
                              "${libhal-neo_LIB_DIRS_DEBUG}" # package_libdir
                              "${libhal-neo_BIN_DIRS_DEBUG}" # package_bindir
                              "${libhal-neo_LIBRARY_TYPE_DEBUG}"
                              "${libhal-neo_IS_HOST_WINDOWS_DEBUG}"
                              libhal-neo_DEPS_TARGET
                              libhal-neo_LIBRARIES_TARGETS  # out_libraries_targets
                              "_DEBUG"
                              "libhal-neo"    # package_name
                              "${libhal-neo_NO_SONAME_MODE_DEBUG}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${libhal-neo_BUILD_DIRS_DEBUG} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Debug ########################################
    set_property(TARGET libhal::neo
                 PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Debug>:${libhal-neo_OBJECTS_DEBUG}>
                 $<$<CONFIG:Debug>:${libhal-neo_LIBRARIES_TARGETS}>
                 APPEND)

    if("${libhal-neo_LIBS_DEBUG}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET libhal::neo
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     libhal-neo_DEPS_TARGET
                     APPEND)
    endif()

    set_property(TARGET libhal::neo
                 PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:Debug>:${libhal-neo_LINKER_FLAGS_DEBUG}> APPEND)
    set_property(TARGET libhal::neo
                 PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Debug>:${libhal-neo_INCLUDE_DIRS_DEBUG}> APPEND)
    # Necessary to find LINK shared libraries in Linux
    set_property(TARGET libhal::neo
                 PROPERTY INTERFACE_LINK_DIRECTORIES
                 $<$<CONFIG:Debug>:${libhal-neo_LIB_DIRS_DEBUG}> APPEND)
    set_property(TARGET libhal::neo
                 PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Debug>:${libhal-neo_COMPILE_DEFINITIONS_DEBUG}> APPEND)
    set_property(TARGET libhal::neo
                 PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Debug>:${libhal-neo_COMPILE_OPTIONS_DEBUG}> APPEND)

########## For the modules (FindXXX)
set(libhal-neo_LIBRARIES_DEBUG libhal::neo)
