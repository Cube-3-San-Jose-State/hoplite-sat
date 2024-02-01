# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(libhal-util_FRAMEWORKS_FOUND_DEBUG "") # Will be filled later
conan_find_apple_frameworks(libhal-util_FRAMEWORKS_FOUND_DEBUG "${libhal-util_FRAMEWORKS_DEBUG}" "${libhal-util_FRAMEWORK_DIRS_DEBUG}")

set(libhal-util_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET libhal-util_DEPS_TARGET)
    add_library(libhal-util_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET libhal-util_DEPS_TARGET
             PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Debug>:${libhal-util_FRAMEWORKS_FOUND_DEBUG}>
             $<$<CONFIG:Debug>:${libhal-util_SYSTEM_LIBS_DEBUG}>
             $<$<CONFIG:Debug>:libhal::libhal>
             APPEND)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### libhal-util_DEPS_TARGET to all of them
conan_package_library_targets("${libhal-util_LIBS_DEBUG}"    # libraries
                              "${libhal-util_LIB_DIRS_DEBUG}" # package_libdir
                              "${libhal-util_BIN_DIRS_DEBUG}" # package_bindir
                              "${libhal-util_LIBRARY_TYPE_DEBUG}"
                              "${libhal-util_IS_HOST_WINDOWS_DEBUG}"
                              libhal-util_DEPS_TARGET
                              libhal-util_LIBRARIES_TARGETS  # out_libraries_targets
                              "_DEBUG"
                              "libhal-util"    # package_name
                              "${libhal-util_NO_SONAME_MODE_DEBUG}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${libhal-util_BUILD_DIRS_DEBUG} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Debug ########################################
    set_property(TARGET libhal::util
                 PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Debug>:${libhal-util_OBJECTS_DEBUG}>
                 $<$<CONFIG:Debug>:${libhal-util_LIBRARIES_TARGETS}>
                 APPEND)

    if("${libhal-util_LIBS_DEBUG}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET libhal::util
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     libhal-util_DEPS_TARGET
                     APPEND)
    endif()

    set_property(TARGET libhal::util
                 PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:Debug>:${libhal-util_LINKER_FLAGS_DEBUG}> APPEND)
    set_property(TARGET libhal::util
                 PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Debug>:${libhal-util_INCLUDE_DIRS_DEBUG}> APPEND)
    # Necessary to find LINK shared libraries in Linux
    set_property(TARGET libhal::util
                 PROPERTY INTERFACE_LINK_DIRECTORIES
                 $<$<CONFIG:Debug>:${libhal-util_LIB_DIRS_DEBUG}> APPEND)
    set_property(TARGET libhal::util
                 PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Debug>:${libhal-util_COMPILE_DEFINITIONS_DEBUG}> APPEND)
    set_property(TARGET libhal::util
                 PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Debug>:${libhal-util_COMPILE_OPTIONS_DEBUG}> APPEND)

########## For the modules (FindXXX)
set(libhal-util_LIBRARIES_DEBUG libhal::util)
